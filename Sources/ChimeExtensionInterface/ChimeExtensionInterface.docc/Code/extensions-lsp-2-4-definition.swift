import Foundation
import ChimeKit

public final class SwiftExtension {
    let host: any HostProtocol
    private let lspService: LSPService

    public init(host: any HostProtocol) {
        self.host = host

        let filter = LSPService.contextFilter(for: [.swiftSource])
        self.lspService = LSPService(host: host,
                                     contextFilter: filter,
                                     executionParamsProvider: SwiftExtension.provideParams)
    }
}

extension SwiftExtension {
    private static func provideParams() throws -> Process.ExecutionParameters {
        return .init(path: "/usr/bin/sourcekit-lsp")
    }
}

extension SwiftExtension: ExtensionProtocol {
}
