import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var name: String = "John " // Default value for preview
}

