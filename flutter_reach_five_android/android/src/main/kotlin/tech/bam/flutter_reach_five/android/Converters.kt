package tech.bam.flutter_reach_five.android

import co.reachfive.identity.sdk.core.models.*
import co.reachfive.identity.sdk.core.models.requests.*

class Converters {
    companion object {
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

        fun profileAddressFromInterface(
            profileAddressInterface: ReachFiveApi.ProfileAddressInterface
        ): ProfileAddress {
            val addressType = when (profileAddressInterface.addressType) {
                ReachFiveApi.ProfileAddressTypeInterface.BILLING -> ProfileAddressType.billing
                ReachFiveApi.ProfileAddressTypeInterface.DELIVERY -> ProfileAddressType.delivery
                null -> null
            }

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
    }
}