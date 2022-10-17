package tech.bam.flutter_reach_five.android

import co.reachfive.identity.sdk.core.ProviderCreator
import co.reachfive.identity.sdk.core.models.*
import co.reachfive.identity.sdk.core.models.requests.*
import co.reachfive.identity.sdk.facebook.FacebookProvider
import co.reachfive.identity.sdk.google.GoogleProvider
import co.reachfive.identity.sdk.webview.WebViewProvider
import tech.bam.flutter_reach_five.android.ReachFiveApi.ConsentInterface
import tech.bam.flutter_reach_five.android.ReachFiveApi.EmailsInterface
import tech.bam.flutter_reach_five.android.ReachFiveApi.LoginSummaryInterface
import tech.bam.flutter_reach_five.android.ReachFiveApi.ProfileAddressInterface
import tech.bam.flutter_reach_five.android.ReachFiveApi.ProfileAddressTypeInterface
import tech.bam.flutter_reach_five.android.ReachFiveApi.ProfileInterface

class Converters {
    companion object {
        fun parseError(
        reachFiveError: ReachFiveError,
        errorCodesInterface: ReachFiveApi.ErrorCodesInterface,
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
            return defaultFlutterError
        }

        fun authTokenToInterface(
            authToken: AuthToken
        ): ReachFiveApi.AuthTokenInterface {
            val user = authToken.user

            return ReachFiveApi
                .AuthTokenInterface
                .Builder()
                .setIdToken(authToken.idToken)
                .setAccessToken(authToken.accessToken)
                .setRefreshToken(authToken.refreshToken)
                .setTokenType(authToken.tokenType)
                .setExpiresIn(authToken.expiresIn?.toLong())
                .setUser(if (user != null) openIdUserToInterface(user) else null)
                .build()
        }

        fun authTokenFromInterface(
            authTokenInterface: ReachFiveApi.AuthTokenInterface
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

        fun openIdUserToInterface(
            openIdUser: OpenIdUser
        ): ReachFiveApi.OpenIdUserInterface {
            val address = openIdUser.address

            return ReachFiveApi
                .OpenIdUserInterface
                .Builder()
                .setId(openIdUser.id)
                .setName(openIdUser.name)
                .setPreferredUsername(openIdUser.preferredUsername)
                .setGivenName(openIdUser.givenName)
                .setFamilyName(openIdUser.familyName)
                .setMiddleName(openIdUser.middleName)
                .setNickname(openIdUser.nickname)
                .setPicture(openIdUser.picture)
                .setWebsite(openIdUser.website)
                .setEmail(openIdUser.email)
                .setEmailVerified(openIdUser.emailVerified)
                .setGender(openIdUser.gender)
                .setZoneinfo(openIdUser.zoneinfo)
                .setLocale(openIdUser.locale)
                .setPhoneNumber(openIdUser.phoneNumber)
                .setPhoneNumberVerified(openIdUser.phoneNumberVerified)
                .setAddress(
                    if (address != null) addressToInterface(address) else null
                )
                .setBirthdate(openIdUser.birthdate)
                .setExternalId(openIdUser.externalId)
                .build()
        }

        fun openIdUserFromInterface(
            openIdUserInterface: ReachFiveApi.OpenIdUserInterface
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

        fun addressToInterface(
            address: Address
        ): ReachFiveApi.AddressInterface {
            return ReachFiveApi.AddressInterface
                .Builder()
                .setFormatted(address.formatted)
                .setStreetAddress(address.streetAddress)
                .setLocality(address.locality)
                .setRegion(address.region)
                .setPostalCode(address.postalCode)
                .setCountry(address.country)
                .build()
        }

        fun addressFromInterface(
            addressInterface: ReachFiveApi.AddressInterface
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
            profileSignupRequestInterface: ReachFiveApi.ProfileSignupRequestInterface
        ): ProfileSignupRequest {
            val addresses = profileSignupRequestInterface.addresses?.map { addressRequest ->
                profileAddressFromInterface(addressRequest)
            }

            val consents = profileSignupRequestInterface.consents?.mapValues { consentRequestMapEntry ->
                consentFromInterface(consentRequestMapEntry.value)
            }

            return ProfileSignupRequest(
                email = profileSignupRequestInterface.email,
                password = profileSignupRequestInterface.password,
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
                customFields = profileSignupRequestInterface.customFields,
                consents = consents,
                liteOnly = profileSignupRequestInterface.liteOnly
            )
        }

        fun addressTypeToInterface(
            addressType: ProfileAddressType?
        ): ProfileAddressTypeInterface? {
            return when (addressType) {
                ProfileAddressType.billing -> ProfileAddressTypeInterface.BILLING
                ProfileAddressType.delivery -> ProfileAddressTypeInterface.DELIVERY
                null -> null
            }
        }

        fun addressTypeFromInterface(
            addressTypeInterface: ProfileAddressTypeInterface?
        ): ProfileAddressType? {
            return when (addressTypeInterface) {
                ProfileAddressTypeInterface.BILLING -> ProfileAddressType.billing
                ProfileAddressTypeInterface.DELIVERY -> ProfileAddressType.delivery
                null -> null
            }
        }

        fun profileAddressToInterface(
            profileAddress: ProfileAddress
        ): ProfileAddressInterface {
            val addressType = addressTypeToInterface(profileAddress.addressType)

            return ProfileAddressInterface.Builder()
                .setTitle(profileAddress.title)
                .setIsDefault(profileAddress.isDefault)
                .setAddressType(addressType)
                .setStreetAddress(profileAddress.streetAddress)
                .setLocality(profileAddress.locality)
                .setRegion(profileAddress.region)
                .setPostalCode(profileAddress.postalCode)
                .setCountry(profileAddress.country)
                .setRaw(profileAddress.raw)
                .setDeliveryNote(profileAddress.deliveryNote)
                .setRecipient(profileAddress.recipient)
                .setCompany(profileAddress.company)
                .setPhoneNumber(profileAddress.phoneNumber)
                .build()
        }

        fun profileAddressFromInterface(
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

        fun consentToInterface(
            consent: Consent
        ): ConsentInterface {

            return ConsentInterface.Builder()
                .setGranted(consent.granted)
                .setConsentType(consent.consentType)
                .setDate(consent.date)
                .build()
        }

        fun consentFromInterface(
            consentInterface: ConsentInterface
        ): Consent {

            return Consent(
                granted = consentInterface.granted,
                consentType = consentInterface.consentType,
                date = consentInterface.date,
            )
        }

        fun providerCreatorFromInterface(
            providerCreatorInterface: ReachFiveApi.ProviderCreatorInterface
        ): ProviderCreator {
            return when (providerCreatorInterface.type) {
                ReachFiveApi.ProviderCreatorTypeInterface.GOOGLE -> GoogleProvider()
                ReachFiveApi.ProviderCreatorTypeInterface.FACEBOOK -> FacebookProvider()
                ReachFiveApi.ProviderCreatorTypeInterface.WEBVIEW -> WebViewProvider()
            }
        }

        fun loginSummaryToInterface(
            loginSummary: LoginSummary
        ): LoginSummaryInterface {
            return LoginSummaryInterface.Builder()
                .setFirstLogin(loginSummary.firstLogin?.toDouble())
                .setLastLogin(loginSummary.lastLogin?.toDouble())
                .setTotal(loginSummary.total?.toLong())
                .setOrigins(loginSummary.origins)
                .setDevices(loginSummary.devices)
                .setLastProvider(loginSummary.lastProvider)
                .build()
        }

        fun loginSummaryFromInterface(
            loginSummaryInterface: LoginSummaryInterface
        ): LoginSummary {
            return LoginSummary(
                firstLogin = loginSummaryInterface.firstLogin?.toLong(),
                lastLogin = loginSummaryInterface.lastLogin?.toLong(),
                total = loginSummaryInterface.total?.toInt(),
                origins = loginSummaryInterface.origins,
                devices = loginSummaryInterface.devices,
                lastProvider = loginSummaryInterface.lastProvider
            )
        }

        fun emailsToInterface(
            emails: Emails
        ): EmailsInterface {
            return EmailsInterface.Builder()
                .setVerified(emails.verified)
                .setUnverified(emails.unverified)
                .build()
        }

        fun emailsFromInterface(
            emailsInterface: EmailsInterface
        ): Emails {
            return Emails(
                verified = emailsInterface.verified,
                unverified = emailsInterface.unverified
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

            return ProfileInterface.Builder()
                .setUid(profile.uid)
                .setGivenName(profile.givenName)
                .setMiddleName(profile.middleName)
                .setFamilyName(profile.familyName)
                .setName(profile.name)
                .setNickname(profile.nickname)
                .setBirthdate(profile.birthdate)
                .setProfileURL(profile.profileURL)
                .setPicture(profile.picture)
                .setExternalId(profile.externalId)
                .setAuthTypes(profile.authTypes)
                .setLoginSummary(if (loginSummary != null) loginSummaryToInterface(loginSummary) else null)
                .setUsername(profile.username)
                .setGender(profile.gender)
                .setEmail(profile.email)
                .setEmailVerified(profile.emailVerified)
                .setEmails(if (emails != null) emailsToInterface(emails) else null)
                .setPhoneNumber(profile.phoneNumber)
                .setPhoneNumberVerified(profile.phoneNumberVerified)
                .setAddresses(addresses)
                .setLocale(profile.locale)
                .setBio(profile.bio)
                .setCustomFields(profile.customFields)
                .setConsents(consents)
                .setCreatedAt(profile.createdAt)
                .setUpdatedAt(profile.updatedAt)
                .setLiteOnly(profile.liteOnly)
                .setCompany(profile.company)
                .build()
        }

        fun profileFromInterface(
            profileInterface: ProfileInterface
        ): Profile {
            val loginSummaryInterface = profileInterface.loginSummary

            val emailsInterface = profileInterface.emails

            val addresses = profileInterface.addresses?.map { address ->
                profileAddressFromInterface(address)
            }

            val consents = profileInterface.consents?.mapValues { consentInterfaceMapEntry ->
                consentFromInterface(consentInterfaceMapEntry.value)
            }

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
                authTypes = profileInterface.authTypes,
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
                customFields = profileInterface.customFields,
                consents = consents,
                createdAt = profileInterface.createdAt,
                updatedAt = profileInterface.updatedAt,
                liteOnly = profileInterface.liteOnly,
                company = profileInterface.company
            )
        }
    }
}