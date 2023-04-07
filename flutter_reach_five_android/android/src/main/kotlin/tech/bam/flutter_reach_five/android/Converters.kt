package tech.bam.flutter_reach_five.android

import co.reachfive.identity.sdk.core.ProviderCreator
import co.reachfive.identity.sdk.core.models.*
import co.reachfive.identity.sdk.core.models.requests.*
import co.reachfive.identity.sdk.facebook.FacebookProvider
import co.reachfive.identity.sdk.google.GoogleProvider
import co.reachfive.identity.sdk.webview.WebViewProvider

class Converters {
    companion object {
        fun parseError(
        reachFiveError: ReachFiveError,
        errorCodesInterface: ErrorCodesInterface,
        defaultFlutterError: FlutterError
        ): FlutterError {
            if (reachFiveError.data?.errorMessageKey == "error.email.alreadyInUse") {
                val errorCode = errorCodesInterface.emailAlreadyInUseCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.errorMessageKey == "error.invalidEmailOrPassword") {
                val errorCode = errorCodesInterface.invalidEmailOrPasswordCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.errorMessageKey == "error.invalidVerificationCode") {
                val errorCode = errorCodesInterface.invalidVerificationCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.error == "invalid_grant") {
                val errorCode = errorCodesInterface.invalidGrant
                val errorUsrMessage = reachFiveError.data?.errorDescription ?: ""
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.code == 52001) {
                val errorCode = errorCodesInterface.userCancelledOrClosedTheWebFlow
                val errorMessage = reachFiveError.message
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.errorMessageKey == "error.socialAccountEmailAlreadyInUse") {
                val errorCode = errorCodesInterface.socialAccountEmailAlreadyInUse
                val errorUsrMessage = reachFiveError.data?.errorDescription ?: ""
                return FlutterError(
                    code= errorCode,
                    message= "$errorCode - $errorUsrMessage",
                    details = null
                )
            }
            return defaultFlutterError
        }

        fun authTokenToInterface(
            authToken: AuthToken
        ): AuthTokenInterface {
            val user = authToken.user

            return AuthTokenInterface(
                    idToken = authToken.idToken,
                    accessToken = authToken.accessToken,
                    refreshToken = authToken.refreshToken,
                    tokenType = authToken.tokenType,
                    expiresIn = authToken.expiresIn?.toLong(),
                    user = if (user != null) openIdUserToInterface(user) else null
            )
        }

        fun authTokenFromInterface(
            authTokenInterface: AuthTokenInterface
        ): AuthToken {
            val user = authTokenInterface.user

            return AuthToken(
                idToken = authTokenInterface.idToken,
                accessToken = authTokenInterface.accessToken,
                refreshToken = authTokenInterface.refreshToken,
                tokenType = authTokenInterface.tokenType,
                expiresIn = authTokenInterface.expiresIn?.toInt(),
                user = if(user != null) openIdUserFromInterface(user) else null
            )
        }

        private fun openIdUserToInterface(
            openIdUser: OpenIdUser
        ): OpenIdUserInterface {
            val address = openIdUser.address

            return OpenIdUserInterface(
                    id = openIdUser.id,
                    name = openIdUser.name,
                    preferredUsername = openIdUser.preferredUsername,
                    givenName = openIdUser.givenName,
                    familyName = openIdUser.familyName,
                    middleName = openIdUser.middleName,
                    nickname = openIdUser.nickname,
                    picture = openIdUser.picture,
                    website = openIdUser.website,
                    email = openIdUser.email,
                    emailVerified = openIdUser.emailVerified,
                    gender = openIdUser.gender,
                    zoneinfo = openIdUser.zoneinfo,
                    locale = openIdUser.locale,
                    phoneNumber = openIdUser.phoneNumber,
                    phoneNumberVerified = openIdUser.phoneNumberVerified,
                    address = if (address != null) addressToInterface(address) else null,
                    birthdate = openIdUser.birthdate,
                    externalId = openIdUser.externalId
            )
        }

        private fun openIdUserFromInterface(
            openIdUserInterface: OpenIdUserInterface
        ): OpenIdUser {
            val address = openIdUserInterface.address

            return OpenIdUser(
                id = openIdUserInterface.id,
                name = openIdUserInterface.name,
                preferredUsername = openIdUserInterface.preferredUsername,
                givenName = openIdUserInterface.givenName,
                familyName = openIdUserInterface.familyName,
                middleName = openIdUserInterface.middleName,
                nickname = openIdUserInterface.nickname,
                picture = openIdUserInterface.picture,
                website = openIdUserInterface.website,
                email = openIdUserInterface.email,
                emailVerified = openIdUserInterface.emailVerified,
                gender = openIdUserInterface.gender,
                zoneinfo = openIdUserInterface.zoneinfo,
                locale = openIdUserInterface.locale,
                phoneNumber = openIdUserInterface.phoneNumber,
                phoneNumberVerified = openIdUserInterface.phoneNumberVerified,
                address = if (address != null) addressFromInterface(address) else null,
                birthdate = openIdUserInterface.birthdate,
                externalId = openIdUserInterface.externalId
            )
        }

        private fun addressToInterface(
            address: Address
        ): AddressInterface {
            return AddressInterface(
                    formatted = address.formatted,
                    streetAddress = address.streetAddress,
                    locality = address.locality,
                    region = address.region,
                    postalCode = address.postalCode,
                    country = address.country,
            )
        }

        private fun addressFromInterface(
            addressInterface: AddressInterface
        ): Address {
            return Address(
                formatted = addressInterface.formatted,
                streetAddress = addressInterface.streetAddress,
                locality = addressInterface.locality,
                region = addressInterface.region,
                postalCode = addressInterface.postalCode,
                country = addressInterface.country,
            )
        }

        fun signupRequestFromInterface(
            profileSignupRequestInterface: ProfileSignupRequestInterface
        ): ProfileSignupRequest {
            val addresses = profileSignupRequestInterface.addresses?.mapNotNull { addressRequest ->
                if (addressRequest != null) profileAddressFromInterface(addressRequest) else null
            }

            val consents = profileSignupRequestInterface.consents?.mapValues { consentRequestMapEntry ->
                val consentRequestMapEntryValue = consentRequestMapEntry.value
                if (consentRequestMapEntryValue != null) consentFromInterface(consentRequestMapEntryValue) else null
            }

            @Suppress("UNCHECKED_CAST")
            return ProfileSignupRequest(
                    password = profileSignupRequestInterface.password,
                    email = profileSignupRequestInterface.email,
                    phoneNumber = profileSignupRequestInterface.phoneNumber,
                    givenName = profileSignupRequestInterface.givenName,
                    middleName = profileSignupRequestInterface.middleName,
                    familyName = profileSignupRequestInterface.familyName,
                    name = profileSignupRequestInterface.name,
                    nickname = profileSignupRequestInterface.nickname,
                    birthdate = profileSignupRequestInterface.birthdate,
                    profileURL = profileSignupRequestInterface.profileURL,
                    picture = profileSignupRequestInterface.picture,
                    username = profileSignupRequestInterface.username,
                    gender = profileSignupRequestInterface.gender,
                    company = profileSignupRequestInterface.company,
                    addresses = addresses,
                    locale = profileSignupRequestInterface.locale,
                    bio = profileSignupRequestInterface.bio,
                    customFields = profileSignupRequestInterface.customFields?.filter {
                        mapEntry -> mapEntry.key == null || mapEntry.value == null } as Map<String, Any>,
                    consents = consents?.filter {
                        mapEntry -> mapEntry.key == null || mapEntry.value == null } as Map<String, Consent>,
                    liteOnly = profileSignupRequestInterface.liteOnly,
            )
        }

        private fun addressTypeToInterface(
            addressType: ProfileAddressType?
        ): ProfileAddressTypeInterface? {
            return when (addressType) {
                ProfileAddressType.billing -> ProfileAddressTypeInterface.BILLING
                ProfileAddressType.delivery -> ProfileAddressTypeInterface.DELIVERY
                null -> null
            }
        }

        private fun addressTypeFromInterface(
            addressTypeInterface: ProfileAddressTypeInterface?
        ): ProfileAddressType? {
            return when (addressTypeInterface) {
                ProfileAddressTypeInterface.BILLING -> ProfileAddressType.billing
                ProfileAddressTypeInterface.DELIVERY -> ProfileAddressType.delivery
                null -> null
            }
        }

        private fun profileAddressToInterface(
            profileAddress: ProfileAddress
        ): ProfileAddressInterface {
            val addressType = addressTypeToInterface(profileAddress.addressType)

            return ProfileAddressInterface(
                    title = profileAddress.title,
                    isDefault = profileAddress.isDefault,
                    addressType = addressType,
                    streetAddress = profileAddress.streetAddress,
                    locality = profileAddress.locality,
                    region = profileAddress.region,
                    postalCode = profileAddress.postalCode,
                    country = profileAddress.country,
                    raw = profileAddress.raw,
                    deliveryNote = profileAddress.deliveryNote,
                    recipient = profileAddress.recipient,
                    company = profileAddress.company,
                    phoneNumber = profileAddress.phoneNumber
            )
        }

        private fun profileAddressFromInterface(
            profileAddressInterface: ProfileAddressInterface
        ): ProfileAddress {
            val addressType = addressTypeFromInterface(profileAddressInterface.addressType)

            return ProfileAddress(
                title = profileAddressInterface.title,
                isDefault = profileAddressInterface.isDefault,
                addressType = addressType,
                streetAddress = profileAddressInterface.streetAddress,
                locality = profileAddressInterface.locality,
                region = profileAddressInterface.region,
                postalCode = profileAddressInterface.postalCode,
                country = profileAddressInterface.country,
                raw = profileAddressInterface.raw,
                deliveryNote = profileAddressInterface.deliveryNote,
                recipient = profileAddressInterface.recipient,
                company = profileAddressInterface.company,
                phoneNumber = profileAddressInterface.phoneNumber
            )
        }

        private fun consentToInterface(
            consent: Consent
        ): ConsentInterface {

            return ConsentInterface(
                    granted = consent.granted,
                    consentType = consent.consentType,
                    date = consent.date,
            )
        }

        private fun consentFromInterface(
            consentInterface: ConsentInterface
        ): Consent {

            return Consent(
                granted = consentInterface.granted,
                consentType = consentInterface.consentType,
                date = consentInterface.date,
            )
        }

        fun providerCreatorFromInterface(
            providerCreatorInterface: ProviderCreatorInterface
        ): ProviderCreator {
            return when (providerCreatorInterface.type) {
                ProviderCreatorTypeInterface.GOOGLE -> GoogleProvider()
                ProviderCreatorTypeInterface.FACEBOOK -> FacebookProvider()
                ProviderCreatorTypeInterface.WEBVIEW -> WebViewProvider()
            }
        }

        private fun loginSummaryToInterface(
            loginSummary: LoginSummary
        ): LoginSummaryInterface {
            return LoginSummaryInterface(
                    firstLogin = loginSummary.firstLogin?.toDouble(),
                    lastLogin = loginSummary.lastLogin?.toDouble(),
                    total = loginSummary.total?.toLong(),
                    origins = loginSummary.origins,
                    devices = loginSummary.devices,
                    lastProvider = loginSummary.lastProvider,
            )
        }

        private fun loginSummaryFromInterface(
            loginSummaryInterface: LoginSummaryInterface
        ): LoginSummary {
            return LoginSummary(
                firstLogin = loginSummaryInterface.firstLogin?.toLong(),
                lastLogin = loginSummaryInterface.lastLogin?.toLong(),
                total = loginSummaryInterface.total?.toInt(),
                origins = loginSummaryInterface.origins?.filterNotNull(),
                devices = loginSummaryInterface.devices?.filterNotNull(),
                lastProvider = loginSummaryInterface.lastProvider
            )
        }

        private fun emailsToInterface(
            emails: Emails
        ): EmailsInterface {
            return EmailsInterface(
                    verified = emails.verified,
                    unverified = emails.unverified
            )
        }

        private fun emailsFromInterface(
            emailsInterface: EmailsInterface
        ): Emails {
            return Emails(
                verified = emailsInterface.verified?.filterNotNull(),
                unverified = emailsInterface.unverified?.filterNotNull()
            )
        }

        fun profileToInterface(
            profile: Profile
        ): ProfileInterface {
            val loginSummary = profile.loginSummary

            val emails = profile.emails

            val addresses = profile.addresses?.map { address ->
                profileAddressToInterface(address)
            }

            val consents = profile.consents?.mapValues { consentMapEntry ->
                consentToInterface(consentMapEntry.value)
            }

            return ProfileInterface(
                    uid = profile.uid,
                    givenName = profile.givenName,
                    middleName = profile.middleName,
                    familyName = profile.familyName,
                    name = profile.name,
                    nickname = profile.nickname,
                    birthdate = profile.birthdate,
                    profileURL = profile.profileURL,
                    picture = profile.picture,
                    externalId = profile.externalId,
                    authTypes = profile.authTypes,
                    loginSummary = if (loginSummary != null) loginSummaryToInterface(loginSummary) else null,
                    username = profile.username,
                    gender = profile.gender,
                    email = profile.email,
                    emailVerified = profile.emailVerified,
                    emails = if (emails != null) emailsToInterface(emails) else null,
                    phoneNumber = profile.phoneNumber,
                    phoneNumberVerified = profile.phoneNumberVerified,
                    addresses = addresses,
                    locale = profile.locale,
                    bio = profile.bio,
                    customFields = profile.customFields?.toMap<String?, Any?>(),
                    consents = consents?.toMap<String?, ConsentInterface?>(),
                    createdAt = profile.createdAt,
                    updatedAt = profile.updatedAt,
                    liteOnly = profile.liteOnly,
                    company = profile.company,

            )
        }

        fun profileFromInterface(
            profileInterface: ProfileInterface
        ): Profile {
            val loginSummaryInterface = profileInterface.loginSummary

            val emailsInterface = profileInterface.emails

            val addresses = profileInterface.addresses?.mapNotNull { address ->
                if (address != null) profileAddressFromInterface(address) else null
            }

            val consents = profileInterface.consents?.mapValues { consentInterfaceMapEntry ->
                val consentInterfaceMapEntryValue = consentInterfaceMapEntry.value
                if (consentInterfaceMapEntryValue != null) consentFromInterface(consentInterfaceMapEntryValue) else null
            }

            @Suppress("UNCHECKED_CAST")
            return Profile(
                uid = profileInterface.uid,
                givenName = profileInterface.givenName,
                middleName = profileInterface.middleName,
                familyName = profileInterface.familyName,
                name = profileInterface.name,
                nickname = profileInterface.nickname,
                birthdate = profileInterface.birthdate,
                profileURL = profileInterface.profileURL,
                picture = profileInterface.picture,
                externalId = profileInterface.externalId,
                authTypes = profileInterface.authTypes?.filterNotNull(),
                loginSummary = if (loginSummaryInterface != null) loginSummaryFromInterface(loginSummaryInterface) else null,
                username = profileInterface.username,
                gender = profileInterface.gender,
                email = profileInterface.email,
                emailVerified = profileInterface.emailVerified,
                emails = if (emailsInterface != null) emailsFromInterface(emailsInterface) else null,
                phoneNumber = profileInterface.phoneNumber,
                phoneNumberVerified = profileInterface.phoneNumberVerified,
                addresses = addresses,
                locale = profileInterface.locale,
                bio = profileInterface.bio,
                customFields = profileInterface.customFields?.filter {
                    mapEntry -> mapEntry.key == null || mapEntry.value == null } as Map<String, Any>,
                consents = consents?.filter {
                    mapEntry -> mapEntry.key == null || mapEntry.value == null } as Map<String, Consent>,
                createdAt = profileInterface.createdAt,
                updatedAt = profileInterface.updatedAt,
                liteOnly = profileInterface.liteOnly,
                company = profileInterface.company
            )
        }
    }
}