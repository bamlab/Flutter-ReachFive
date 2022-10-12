import IdentitySdkCore
import IdentitySdkGoogle
import IdentitySdkFacebook
import IdentitySdkWebView

public class Converters {

    static public func parseError(
            reachFiveError: ReachFiveError,
            errorCodesInterface: ErrorCodesInterface,
            defaultFlutterError: FlutterError
    ) -> FlutterError {
        switch reachFiveError {
        case .RequestError(apiError: let apiError):
            if (apiError.errorMessageKey == "error.email.alreadyInUse") {
                return FlutterError(
                        code: errorCodesInterface.emailAlreadyInUseCode,
                        message: apiError.errorUserMsg,
                        details: nil
                )
            }
            return defaultFlutterError
        case .AuthFailure(reason: _, apiError: let apiError):
            if (apiError?.errorMessageKey == "error.invalidEmailOrPassword") {
                return FlutterError(
                        code: errorCodesInterface.invalidEmailOrPasswordCode,
                        message: apiError?.errorUserMsg,
                        details: nil
                )
            }
            if (apiError?.errorMessageKey == "error.invalidVerificationCode") {
                return FlutterError(
                        code: errorCodesInterface.invalidVerificationCode,
                        message: apiError?.errorUserMsg,
                        details: nil
                )
            }
            return defaultFlutterError
        case .AuthCanceled:
            return defaultFlutterError
        case .TechnicalError(reason: _, apiError: _):
            return defaultFlutterError
        }
    }
    
    static public func authTokenToInterface(
            authToken: AuthToken
        ) -> AuthTokenInterface {
            
            let expriresIn = authToken.expiresIn as NSNumber?
            
            let user = authToken.user != nil
            ? openIdUserToInterface(openIdUser: authToken.user!)
            : nil
            
            return AuthTokenInterface.make(
                withIdToken: authToken.idToken,
                accessToken: authToken.accessToken,
                refreshToken: authToken.refreshToken,
                tokenType: authToken.tokenType,
                expiresIn: expriresIn,
                user: user
            )
        }
    
    static public func authTokenFromInterface(
            authTokenInterface: AuthTokenInterface
        ) -> AuthToken {
            
            let expriresIn = authTokenInterface.expiresIn as? Int
            
            let user = authTokenInterface.user != nil
            ? openIdUserFromInterface(
                openIdUserInterface: authTokenInterface.user!
            )
            : nil
            
            return AuthToken(
                idToken: authTokenInterface.idToken,
                accessToken: authTokenInterface.accessToken,
                refreshToken: authTokenInterface.refreshToken,
                tokenType: authTokenInterface.tokenType,
                expiresIn: expriresIn,
                user: user
            )
        }
    
    static public func openIdUserToInterface(
            openIdUser: OpenIdUser
        ) -> OpenIdUserInterface {
            
            let emailVerified = openIdUser.emailVerified as? NSNumber
            
            let phoneNumberVerified = openIdUser.phoneNumberVerified as? NSNumber
            
            let address = openIdUser.address != nil
            ? addressToInterface(address: openIdUser.address!)
            : nil
            
            return OpenIdUserInterface.make(
                withId: openIdUser.id,
                name: openIdUser.name,
                preferredUsername: openIdUser.preferredUsername,
                givenName: openIdUser.givenName,
                familyName: openIdUser.familyName,
                middleName: openIdUser.middleName,
                nickname: openIdUser.nickname,
                picture: openIdUser.picture,
                website: openIdUser.website,
                email: openIdUser.email,
                emailVerified: emailVerified,
                gender: openIdUser.gender,
                zoneinfo: openIdUser.zoneinfo,
                locale: openIdUser.locale,
                phoneNumber: openIdUser.phoneNumber,
                phoneNumberVerified: phoneNumberVerified,
                address: address,
                birthdate: nil,
                externalId: nil
            )
        }
    
    static public func openIdUserFromInterface(
        openIdUserInterface: OpenIdUserInterface
        ) -> OpenIdUser {
            
            let emailVerified = openIdUserInterface.emailVerified as? Bool
            
            let phoneNumberVerified = openIdUserInterface.phoneNumberVerified as? Bool
            
            let address = openIdUserInterface.address != nil
            ? addressFromInterface(
                addressInterface: openIdUserInterface.address!
            )
            : nil
            
            return OpenIdUser(
                id: openIdUserInterface.id,
                name: openIdUserInterface.name,
                preferredUsername: openIdUserInterface.preferredUsername,
                givenName: openIdUserInterface.givenName,
                familyName: openIdUserInterface.familyName,
                middleName: openIdUserInterface.middleName,
                nickname: openIdUserInterface.nickname,
                picture: openIdUserInterface.picture,
                website: openIdUserInterface.website,
                email: openIdUserInterface.email,
                emailVerified: emailVerified,
                gender: openIdUserInterface.gender,
                zoneinfo: openIdUserInterface.zoneinfo,
                locale: openIdUserInterface.locale,
                phoneNumber: openIdUserInterface.phoneNumber,
                phoneNumberVerified: phoneNumberVerified,
                address: address
            )
        }
    
    static public func addressToInterface(
            address: ProfileAddress
        ) -> AddressInterface {

        AddressInterface.make(
            withFormatted: address.raw,
            streetAddress: address.streetAddress,
            locality: address.locality,
            region: address.region,
            postalCode: address.postalCode,
            country: address.country
        )
        }
    
    static public func addressFromInterface(
            addressInterface: AddressInterface
        ) -> ProfileAddress {

        ProfileAddress(
            title: nil,
            isDefault: nil,
            addressType: nil,
            streetAddress: addressInterface.streetAddress,
            locality: addressInterface.locality,
            region: addressInterface.region,
            postalCode: addressInterface.postalCode,
            country: addressInterface.country,
            raw: addressInterface.formatted,
            deliveryNote: nil,
            recipient: nil,
            company: nil,
            phoneNumber: nil
        )
        }
    
    static public func signupRequestFromInterface(
            profileSignupRequestInterface: ProfileSignupRequestInterface
        ) -> ProfileSignupRequest {
            
            let liteOnly = profileSignupRequestInterface.liteOnly as? Bool
            
            let addresses = profileSignupRequestInterface.addresses?
                .map({ addressRequest in
                    profileAddressFromInterface(
                            profileAddressInterface: addressRequest
                    )
                })
            
            var consents = profileSignupRequestInterface.consents != nil
            ? [String: Consent]()
            : nil
            
            profileSignupRequestInterface.consents?.forEach({
                key, consentInterface in
                consents![key] = consentFromInterface(
                    consentInterface: consentInterface
                )
            })
        
            return ProfileSignupRequest(
                password: profileSignupRequestInterface.password,
                email: profileSignupRequestInterface.email,
                phoneNumber: profileSignupRequestInterface.phoneNumber,
                givenName: profileSignupRequestInterface.givenName,
                middleName: profileSignupRequestInterface.middleName,
                familyName: profileSignupRequestInterface.familyName,
                name: profileSignupRequestInterface.name,
                nickname: profileSignupRequestInterface.nickname,
                birthdate: profileSignupRequestInterface.birthdate,
                profileURL: profileSignupRequestInterface.profileURL,
                picture: profileSignupRequestInterface.picture,
                username: profileSignupRequestInterface.username,
                gender: profileSignupRequestInterface.gender,
                addresses: addresses,
                locale: profileSignupRequestInterface.locale,
                bio: profileSignupRequestInterface.bio,
                consents: consents,
                company: profileSignupRequestInterface.company,
                liteOnly: profileSignupRequestInterface.liteOnly as? Bool
            )
        }
    
    static public func addressTypeFromInterface(
                addressTypeInterface: ProfileAddressTypeInterface
            ) -> String? {
                switch addressTypeInterface {
                case ProfileAddressTypeInterface.billing:
                    return "billing"
                case ProfileAddressTypeInterface.delivery:
                    return "delivery"
                @unknown default:
                    return nil
                }
            }
    
    static public func profileAddressFromInterface(
            profileAddressInterface: ProfileAddressInterface
        ) -> ProfileAddress {
            
            let isDefault = profileAddressInterface.isDefault as? Bool
            
            let addressType = addressTypeFromInterface(
                addressTypeInterface: profileAddressInterface.addressType
            )
        
            return ProfileAddress(
                title: profileAddressInterface.title,
                isDefault: isDefault,
                addressType: addressType,
                streetAddress: profileAddressInterface.streetAddress,
                locality: profileAddressInterface.locality,
                region: profileAddressInterface.region,
                postalCode: profileAddressInterface.postalCode,
                country: profileAddressInterface.country,
                raw: profileAddressInterface.raw,
                deliveryNote: profileAddressInterface.deliveryNote,
                recipient: profileAddressInterface.recipient,
                company: profileAddressInterface.company,
                phoneNumber: profileAddressInterface.phoneNumber
            )
        }
    
    static public func consentFromInterface(
        consentInterface: ConsentInterface
        ) -> Consent {

        Consent(
            granted: consentInterface.granted as! Bool,
            consentType: consentInterface.consentType,
            date: consentInterface.date
        )
        }
    
    static public func providerCreatorFromInterface(
                providerCreatorInterface: ProviderCreatorInterface
            ) -> ProviderCreator? {
                switch providerCreatorInterface.type {
                case ProviderCreatorTypeInterface.google:
                    return GoogleProvider()
                case ProviderCreatorTypeInterface.facebook:
                    return FacebookProvider()
                case ProviderCreatorTypeInterface.webview:
                    return WebViewProvider()
                @unknown default:
                    return nil
                }
            }
}
