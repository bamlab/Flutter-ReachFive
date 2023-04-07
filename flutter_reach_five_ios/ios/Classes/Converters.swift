import IdentitySdkCore
import IdentitySdkGoogle
import IdentitySdkFacebook
import IdentitySdkWebView

enum CustomFieldError: Error {
    case casting
}

extension CustomField {
    var value: Any {
        switch self {
        case let .string(value): return value
        case let .int(value): return value
        case let .double(value): return value
        case let .bool(value): return value
        case let .array(value): return value
        }
    }
    
    init(value: Any) throws {
        switch value {
        case is String: self = .string(value as! String)
        case is Int: self = .int(value as! Int)
        case is Double: self = .double(value as! Double)
        case is Bool: self = .bool(value as! Bool)
        default: throw CustomFieldError.casting
        }
    }
}

class Converters {

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
            if (apiError?.error == "invalid_grant") {
                return FlutterError(
                        code: errorCodesInterface.invalidGrant,
                        message: apiError?.errorUserMsg,
                        details: nil
                )
            }
            if (apiError?.errorMessageKey == "error.socialAccountEmailAlreadyInUse") {
                return FlutterError(
                        code: errorCodesInterface.socialAccountEmailAlreadyInUse,
                        message: apiError?.errorUserMsg,
                        details: nil
                )
            }
            return defaultFlutterError
        case .AuthCanceled:
            return FlutterError(
                code: errorCodesInterface.userCancelledOrClosedTheWebFlow,
                message: "Auth was cancelled by the user",
                details: nil
            )
        case .TechnicalError(reason: _, apiError: _):
            return defaultFlutterError
        }
    }
    
    static public func authTokenToInterface(
            authToken: AuthToken
        ) -> AuthTokenInterface {
            
            let expriresIn = authToken.expiresIn
            
            let user = authToken.user != nil
            ? openIdUserToInterface(openIdUser: authToken.user!)
            : nil
            
            return AuthTokenInterface(
                idToken: authToken.idToken,
                accessToken: authToken.accessToken,
                refreshToken: authToken.refreshToken,
                tokenType: authToken.tokenType,
                expiresIn: expriresIn != nil ? Int64(expriresIn!) : nil,
                user: user
            )
        }
    
    static public func authTokenFromInterface(
            authTokenInterface: AuthTokenInterface
        ) -> AuthToken {
            
            let expriresIn = authTokenInterface.expiresIn
            
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
                expiresIn: expriresIn != nil ? Int(expriresIn!) : nil,
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
            
            return OpenIdUserInterface(
                id: openIdUser.id,
                name: openIdUser.name,
                preferredUsername: openIdUser.preferredUsername,
                givenName: openIdUser.givenName,
                familyName: openIdUser.familyName,
                middleName: openIdUser.middleName,
                nickname: openIdUser.nickname,
                picture: openIdUser.picture,
                website: openIdUser.website,
                email: openIdUser.email,
                emailVerified: emailVerified?.boolValue,
                gender: openIdUser.gender,
                zoneinfo: openIdUser.zoneinfo,
                locale: openIdUser.locale,
                phoneNumber: openIdUser.phoneNumber,
                phoneNumberVerified: phoneNumberVerified?.boolValue,
                address: address,
                birthdate: nil,
                externalId: nil
            )
        }
    
    static public func openIdUserFromInterface(
        openIdUserInterface: OpenIdUserInterface
        ) -> OpenIdUser {

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
                emailVerified: openIdUserInterface.emailVerified,
                gender: openIdUserInterface.gender,
                zoneinfo: openIdUserInterface.zoneinfo,
                locale: openIdUserInterface.locale,
                phoneNumber: openIdUserInterface.phoneNumber,
                phoneNumberVerified: openIdUserInterface.phoneNumberVerified,
                address: address
            )
        }

    static public func addressToInterface(
            address: ProfileAddress
    ) -> AddressInterface {

        AddressInterface(
                formatted: address.raw,
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

            let addresses = profileSignupRequestInterface.addresses?
                .map({ addressRequest in
                    addressRequest != nil ? profileAddressFromInterface(
                            profileAddressInterface: addressRequest!
                    ) : nil
                }).filter({
                    address in
                            address != nil
                }) as? Array<ProfileAddress>
            
            var consents = profileSignupRequestInterface.consents != nil
            ? [String: Consent]()
            : nil
            
            profileSignupRequestInterface.consents?.forEach({
                key, consentInterface in
                if (key != nil && consentInterface != nil) {
                    consents![key!] = consentFromInterface(
                        consentInterface: consentInterface!
                    )
                }
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
                liteOnly: profileSignupRequestInterface.liteOnly
            )
        }

    static public func addressTypeToInterface(
                addressType: String?
        ) -> ProfileAddressTypeInterface {
            switch addressType {
            case "billing":
                return ProfileAddressTypeInterface.billing
            case "delivery":
                return ProfileAddressTypeInterface.delivery
            default:
                return ProfileAddressTypeInterface.delivery
            }
        }
    
    static public func addressTypeFromInterface(
                addressTypeInterface: ProfileAddressTypeInterface
            ) -> String? {
                switch addressTypeInterface {
                case ProfileAddressTypeInterface.billing:
                    return "billing"
                case ProfileAddressTypeInterface.delivery:
                    return "delivery"
                }
            }

    static public func profileAddressToInterface(
            profileAddress: ProfileAddress
    ) -> ProfileAddressInterface {

        let isDefault = profileAddress.isDefault as? NSNumber

        let addressType = addressTypeToInterface(
                addressType: profileAddress.addressType
        )

        return ProfileAddressInterface(
                title: profileAddress.title,
                isDefault: isDefault?.boolValue,
                addressType: addressType,
                streetAddress: profileAddress.streetAddress,
                locality: profileAddress.locality,
                region: profileAddress.region,
                postalCode: profileAddress.postalCode,
                country: profileAddress.country,
                raw: profileAddress.raw,
                deliveryNote: profileAddress.deliveryNote,
                recipient: profileAddress.recipient,
                company: profileAddress.company,
                phoneNumber: profileAddress.phoneNumber
        )
    }
    
    static public func profileAddressFromInterface(
            profileAddressInterface: ProfileAddressInterface
        ) -> ProfileAddress {

            let addressType = profileAddressInterface.addressType != nil ? addressTypeFromInterface(
                addressTypeInterface: profileAddressInterface.addressType!
            ) : nil
        
            return ProfileAddress(
                title: profileAddressInterface.title,
                isDefault: profileAddressInterface.isDefault,
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
    
    static public func consentToInterface(
            consent: Consent
    ) -> ConsentInterface {
        return ConsentInterface(
                granted: consent.granted,
                consentType: consent.consentType,
                date: consent.date
        )
    }
    
    static public func consentsToInterface(
        consents: [String: Consent]
    ) -> [String?: ConsentInterface?] {
        return consents.mapValues {consent in consentToInterface(consent: consent)}
    }
    
    static public func consentFromInterface(
        consentInterface: ConsentInterface
        ) -> Consent {
        return Consent(
            granted: consentInterface.granted,
            consentType: consentInterface.consentType,
            date: consentInterface.date
        )
    }
    
    static public func consentsFromInterface(
        consentsInterface: [String?: ConsentInterface?]
    ) -> [String: Consent]? {
        return consentsInterface.mapValues { consent in
            consent != nil ? consentFromInterface(consentInterface: consent!) : nil }.filter({(key, consent) in
                        key != nil && consent != nil
            }) as? [String : Consent]
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

                }
            }

    static public func loginSummaryToInterface(
            loginSummary: LoginSummary
    ) -> LoginSummaryInterface {
        return LoginSummaryInterface(
                firstLogin: loginSummary.firstLogin != nil ? Double(loginSummary.firstLogin!) : nil,
                lastLogin: loginSummary.lastLogin != nil ? Double(loginSummary.lastLogin!) : nil,
                total: loginSummary.total != nil ? Int64(loginSummary.total!) : nil,
                origins: loginSummary.origins,
                devices: loginSummary.devices,
                lastProvider: loginSummary.lastProvider
        )
    }

    static public func loginSummaryFromInterface(
            loginSummaryInterface: LoginSummaryInterface
    ) -> LoginSummary {
        return LoginSummary(
                firstLogin: loginSummaryInterface.firstLogin != nil ? Int(loginSummaryInterface.firstLogin!) : nil,
                lastLogin: loginSummaryInterface.lastLogin != nil ? Int(loginSummaryInterface.lastLogin!) : nil,
                total: loginSummaryInterface.total != nil ? Int(loginSummaryInterface.total!) : nil,
                origins: loginSummaryInterface.origins?.filter({
                    origin in
                            origin != nil
                }) as? [String],
                devices: loginSummaryInterface.devices?.filter({
                    device in
                            device != nil
                }) as? [String],
                lastProvider: loginSummaryInterface.lastProvider
        )
    }

    static public func emailsToInterface(
            emails: Emails
    ) -> EmailsInterface {

        return EmailsInterface(
                verified: emails.verified,
                unverified: emails.unverified
        )
    }

    static public func emailsFromInterface(
            emailsInterface: EmailsInterface
    ) -> Emails {

        return Emails(
                verified: emailsInterface.verified?.filter({
                    origin in
                            origin != nil
                }) as? [String],
                unverified: emailsInterface.unverified?.filter({
                    origin in
                            origin != nil
                }) as? [String]
        )
    }

    static public func profileToInterface(
            profile: Profile
    ) -> ProfileInterface {
        let loginSummary = profile.loginSummary != nil ? loginSummaryToInterface(loginSummary: profile.loginSummary!) : nil
        let emailVerified = profile.emailVerified != nil ? NSNumber.init(booleanLiteral: profile.emailVerified!) : nil
        let emails = profile.emails != nil ? emailsToInterface(emails: profile.emails!) : nil
        let phoneNumberVerified = profile.phoneNumberVerified != nil ? NSNumber.init(booleanLiteral: profile.phoneNumberVerified!) : nil
        let liteOnly = profile.liteOnly != nil ? NSNumber.init(booleanLiteral: profile.liteOnly!) : nil

        let addresses = profile.addresses?
                .map({ profileAddress in
                    profileAddressToInterface(profileAddress: profileAddress)
                })
        
        return ProfileInterface(
                uid: profile.uid,
                givenName: profile.givenName,
                middleName: profile.middleName,
                familyName: profile.familyName,
                name: profile.name,
                nickname: profile.nickname,
                birthdate: profile.birthdate,
                profileURL: profile.profileURL,
                picture: profile.picture,
                externalId: profile.externalId,
                authTypes: profile.authTypes,
                loginSummary: loginSummary,
                username: profile.username,
                gender: profile.gender,
                email: profile.email,
                emailVerified: emailVerified?.boolValue,
                emails: emails,
                phoneNumber: profile.phoneNumber,
                phoneNumberVerified: phoneNumberVerified?.boolValue,
                addresses: addresses,
                locale: profile.locale,
                bio: profile.bio,
                customFields: profile.customFields?.mapValues {customField in customField.value} as? [String? : Any?],
                consents: profile.consents != nil ? consentsToInterface(consents: profile.consents!) : nil,
                createdAt: nil,
                updatedAt: nil,
                liteOnly: liteOnly?.boolValue,
                company: nil
        )
    }

    static public func profileFromInterface(
            profileInterface: ProfileInterface
    ) -> Profile {
        let loginSummary = profileInterface.loginSummary != nil ? loginSummaryFromInterface(loginSummaryInterface: profileInterface.loginSummary!) : nil
        let emails = profileInterface.emails != nil ? emailsFromInterface(emailsInterface: profileInterface.emails!) : nil
        
        let authTypes = profileInterface.authTypes?.filter({
            authType in
            authType != nil
        }) as? [String]

        let addresses = profileInterface.addresses?
                .map({ profileAddressInterface in
                    profileAddressInterface != nil ?
                    profileAddressFromInterface(profileAddressInterface: profileAddressInterface!) : nil
                }).filter({
                    address in
                    address != nil
                }) as? [ProfileAddress]
        
        let consents = profileInterface.consents != nil ? consentsFromInterface(consentsInterface: profileInterface.consents!) : nil
        
        let customFields = try? profileInterface.customFields?.mapValues { customFieldInterface in try CustomField(value: customFieldInterface as Any)} as? [String: CustomField]

        return Profile(
                uid: profileInterface.uid,
                givenName: profileInterface.givenName,
                middleName: profileInterface.middleName,
                familyName: profileInterface.familyName,
                name: profileInterface.name,
                nickname: profileInterface.nickname,
                birthdate: profileInterface.birthdate,
                profileURL: profileInterface.profileURL,
                picture: profileInterface.picture,
                externalId: profileInterface.externalId,
                authTypes: authTypes,
                loginSummary: loginSummary,
                username: profileInterface.username,
                gender: profileInterface.gender,
                email: profileInterface.email,
                emailVerified: profileInterface.emailVerified,
                emails: emails,
                phoneNumber: profileInterface.phoneNumber,
                phoneNumberVerified: profileInterface.phoneNumberVerified,
                addresses: addresses,
                locale: profileInterface.locale,
                bio: profileInterface.bio,
                customFields: customFields,
                consents: consents,
                createdAt: profileInterface.createdAt,
                updatedAt: profileInterface.updatedAt,
                company: profileInterface.company,
                liteOnly: profileInterface.liteOnly
        )
    }
}

extension FlutterError: Error {}
