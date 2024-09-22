import SwiftUI

struct StepByStepGuideView: View {
    @State private var selectedGuide: String? = nil
    @State private var selectedStep: String? = nil
    @State private var showSearchBar: Bool = false
    @State private var showWorkVisaDetails: Bool = false
    @State private var showStudentVisaDetails: Bool = false
    @State private var showTouristVisaDetails: Bool = false
    @State private var showFamilyVisaDetails: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text("Step-by-Step Visa Application Guide")
                        .font(.title)
                        .padding(.top)
                    Spacer()
                    Button(action: {
                        showSearchBar.toggle()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .padding(.trailing)
                    }
                }
                .padding(.leading)
                
                if showSearchBar {
                    // Replace this with your actual search bar implementation
                    Text("Search Bar Placeholder")
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                }
                
                Text("Guides:")
                    .font(.title2)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    guideOption("H1B Visa Guide")
                    
                    if selectedGuide == "H1B Visa Guide" {
                        guideSteps(for: "H1B Visa Guide")
                    }
                    
                    guideOption("Student Visa Guide")
                    
                    if selectedGuide == "Student Visa Guide" {
                        guideSteps(for: "Student Visa Guide")
                    }
                    
                    guideOption("Tourist Visa Guide")
                    
                    if selectedGuide == "Tourist Visa Guide" {
                        guideSteps(for: "Tourist Visa Guide")
                    }
                }
                .padding(.leading)
                
                Text("Visa Types:")
                    .font(.title2)
                    .padding(.leading)
                
                VStack(alignment: .leading) {
                    visaTypeOption("Work Visa", detailsVisible: $showWorkVisaDetails)
                    
                    if showWorkVisaDetails {
                        // Add additional details or options for Work Visa here
                        Text("Details for Work Visa")
                            .padding(.leading)
                    }
                    
                    visaTypeOption("Student Visa", detailsVisible: $showStudentVisaDetails)
                    
                    if showStudentVisaDetails {
                        // Add additional details or options for Student Visa here
                        Text("Details for Student Visa")
                            .padding(.leading)
                    }
                    
                    visaTypeOption("Tourist Visa", detailsVisible: $showTouristVisaDetails)
                    
                    if showTouristVisaDetails {
                        // Add additional details or options for Tourist Visa here
                        Text("Details for Tourist Visa")
                            .padding(.leading)
                    }
                    
                    visaTypeOption("Family Visa", detailsVisible: $showFamilyVisaDetails)
                    
                    if showFamilyVisaDetails {
                        // Add additional details or options for Family Visa here
                        Text("Details for Family Visa")
                            .padding(.leading)
                    }
                }
                .padding(.leading)
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func guideOption(_ guide: String) -> some View {
        Button(action: {
            selectedGuide = guide
            selectedStep = nil
        }) {
            Text(guide)
        }
        .padding(.bottom, 5)
    }
    
    private func visaTypeOption(_ visaType: String, detailsVisible: Binding<Bool>) -> some View {
        Button(action: {
            detailsVisible.wrappedValue.toggle()
            selectedGuide = visaType // Update selectedGuide when the visa type is clicked
            selectedStep = nil
        }) {
            Text(visaType)
        }
        .padding(.bottom, 5)
    }
    
    private func guideSteps(for guide: String) -> some View {
        VStack(alignment: .leading) {
            Text("Guide steps:")
                .font(.headline)
                .padding(.leading)
            
            VStack(alignment: .leading) {
                Button(action: {
                    selectedStep = "Overview of the Visa"
                }) {
                    Text("1. Overview of the Visa")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Eligibility Criteria"
                }) {
                    Text("2. Eligibility Criteria")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Required Documents"
                }) {
                    Text("3. Required Documents")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Application Process"
                }) {
                    Text("4. Application Process")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Fees and Payment"
                }) {
                    Text("5. Fees and Payment")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Interview Preparation"
                }) {
                    Text("6. Interview Preparation")
                }
                .padding(.bottom, 3)
                
                Button(action: {
                    selectedStep = "Post-Application Steps"
                }) {
                    Text("7. Post-Application Steps")
                }
                .padding(.bottom, 3)
            }
            .padding(.leading)
        }
        .padding(.bottom, 10)
    }
}

struct StepByStepGuideView_Previews: PreviewProvider {
    static var previews: some View {
        StepByStepGuideView()
    }
}
