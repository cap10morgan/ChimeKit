import Foundation

import ChimeExtensionInterface
import LanguageServerProtocol

extension DocumentContext {
    var languageIdentifier: LanguageIdentifier? {
        if uti.conforms(to: .rubyScript) {
            return .ruby
        }

        if uti.conforms(to: .goSource) || uti.conforms(to: .goModFile) {
            return .go
        }

        if uti.conforms(to: .luaSource) {
            return .lua
        }

		if uti.conforms(to: .swiftSource) {
			return .swift
		}

		if uti.conforms(to: .json) {
			return .json
		}

        return nil
    }
}
