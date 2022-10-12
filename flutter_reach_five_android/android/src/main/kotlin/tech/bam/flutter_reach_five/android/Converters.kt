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
        errorCodesInterface: ReachFiveApi.ErrorCodesInterface,
        defaultFlutterError: FlutterError
        ): FlutterError {
            if (reachFiveError.data?.errorMessageKey == "error.email.alreadyInUse") {
                val errocCode = errorCodesInterface.emailAlreadyInUseCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errocCode,
                    message= "$errocCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.errorMessageKey == "error.invalidEmailOrPassword") {
                val errocCode = errorCodesInterface.invalidEmailOrPasswordCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errocCode,
                    message= "$errocCode - $errorUsrMessage",
                    details = null
                )
            }
            if (reachFiveError.data?.errorMessageKey == "error.invalidVerificationCode") {
                val errocCode = errorCodesInterface.invalidVerificationCode
                val errorUsrMessage = reachFiveError.data?.errorUserMsg ?: ""
                return FlutterError(
                    code= errocCode,
                    message= "$errocCode - $errorUsrMessage",
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

        fun addressTypeFromInterface(
            addressTypeInterface: ReachFiveApi.ProfileAddressTypeInterface?
        ): ProfileAddressType? {
            return when (addressTypeInterface) {
                ReachFiveApi.ProfileAddressTypeInterface.BILLING -> ProfileAddressType.billing
                ReachFiveApi.ProfileAddressTypeInterface.DELIVERY -> ProfileAddressType.delivery
                null -> null
            }
        }

        fun profileAddressFromInterface(
            profileAddressInterface: ReachFiveApi.ProfileAddressInterface
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

        fun consentFromInterface(
            consentInterface: ReachFiveApi.ConsentInterface
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
    }
}