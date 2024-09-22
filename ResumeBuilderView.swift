import SwiftUI
import PDFKit

enum EducationLevel: String, CaseIterable {
    case highSchool = "High School"
    case associates = "Associate's Degree"
    case bachelors = "Bachelor's Degree"
    case masters = "Master's Degree"
    case doctorate = "Doctorate"
}

struct Experience {
    var company: String
    var description: String
    var startDate: Date
    var endDate: Date?
}

struct ResumeBuilderView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var location = ""
    @State private var areaOfStudy = ""
    @State private var selectedEducationLevel: EducationLevel = .highSchool
    @State private var softSkills = ""
    @State private var technicalSkills = ""
    @State private var experiences: [Experience] = []
    
    // Function to generate PDF
    private func generatePDF() -> PDFDocument {
        let pdfMetaData = [
            kCGPDFContextCreator: "Your App Name",
            kCGPDFContextAuthor: "Your Name"
        ]
        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]
        
        let renderer = UIGraphicsPDFRenderer(bounds: CGRect(x: 0, y: 0, width: 612, height: 792), format: format)
        
        let data = renderer.pdfData { context in
            // PDF Generation Code
            let pdfTitle = "Resume"
            let nameInfo = "Name: \(name)"
            let contactInfo = "Email: \(email)\nPhone: \(phone)\nLocation: \(location)"
            let educationInfo = "Education Level: \(selectedEducationLevel.rawValue)\nArea of Study: \(areaOfStudy)"
            let skillsInfo = "Soft Skills: \(softSkills)\nTechnical Skills: \(technicalSkills)"
            
            // Start PDF content
            context.beginPage()
            
            // Add text to PDF
            let titleFont = UIFont.boldSystemFont(ofSize: 24.0)
            let regularFont = UIFont.systemFont(ofSize: 12.0)
            
            var textRect = CGRect(x: 20, y: 20, width: 572, height: 50)
            pdfTitle.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: titleFont])
            
            textRect = CGRect(x: 20, y: 80, width: 572, height: 20)
            nameInfo.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: regularFont])
            
            textRect = CGRect(x: 20, y: 120, width: 572, height: 60)
            contactInfo.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: regularFont])
            
            textRect = CGRect(x: 20, y: 200, width: 572, height: 40)
            educationInfo.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: regularFont])
            
            textRect = CGRect(x: 20, y: 260, width: 572, height: 60)
            skillsInfo.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: regularFont])
            
            // Experience section
            if !experiences.isEmpty {
                var yOffset = 340 // Adjust Y offset as needed
                for exp in experiences {
                    let expInfo = "\(exp.company)\nDescription: \(exp.description)\nStart Date: \(exp.startDate)\nEnd Date: \(exp.endDate ?? Date())"
                    textRect = CGRect(x: 20, y: yOffset, width: 572, height: 80) // Adjust height as needed
                    expInfo.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: regularFont])
                    yOffset += 100 // Adjust spacing as needed
                }
            }
        }
        
        return PDFDocument(data: data)!
    }
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Resume Builder")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Text("Name:")
                            .fontWeight(.bold)
                        TextField("Enter your name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Email:")
                            .fontWeight(.bold)
                        TextField("Enter your email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Phone:")
                            .fontWeight(.bold)
                        TextField("Enter your phone number", text: $phone)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Location:")
                            .fontWeight(.bold)
                        TextField("Enter your location", text: $location)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Area of Study:")
                            .fontWeight(.bold)
                        TextField("Enter your area of study", text: $areaOfStudy)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Education Level:")
                            .fontWeight(.bold)
                        Spacer()
                        Menu(selectedEducationLevel.rawValue) {
                            ForEach(EducationLevel.allCases, id: \.self) { level in
                                Button(action: {
                                    selectedEducationLevel = level
                                }) {
                                    Text(level.rawValue)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Soft Skills:")
                            .fontWeight(.bold)
                        TextField("Enter your soft skills", text: $softSkills)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    HStack {
                        Text("Technical Skills:")
                            .fontWeight(.bold)
                        TextField("Enter your technical skills", text: $technicalSkills)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    // Experience section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Experience")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        ForEach(experiences.indices, id: \.self) { index in
                            ExperienceView(experience: $experiences[index])
                        }
                        
                        Button(action: {
                            experiences.append(Experience(company: "", description: "", startDate: Date(), endDate: nil))
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add Experience")
                                    .fontWeight(.semibold)
                            }
                        }
                        .foregroundColor(.blue)
                        .padding(.top, 10)
                    }
                }
                .padding()
                
                Button("Create Resume") {
                    let pdf = generatePDF()
                    // Save or present the PDF
                    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    let pdfPath = documentsPath.appendingPathComponent("resume.pdf")
                    
                    do {
                        try pdf.write(to: pdfPath)
                        // Provide option to download or view the PDF
                        // Example: Present the PDF to the user
                        
                        let activityViewController = UIActivityViewController(activityItems: [pdfPath], applicationActivities: nil)
                        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                    } catch {
                        print("Error writing PDF to path: \(error.localizedDescription)")
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.bottom)
            }
        }
    }
}

struct ExperienceView: View {
    @Binding var experience: Experience
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            TextField("Company", text: $experience.company)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Description", text: $experience.description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                Text("Start Date:")
                Spacer()
                DatePicker("", selection: $experience.startDate, displayedComponents: .date)
                    .labelsHidden()
            }
            HStack {
                Text("End Date:")
                Spacer()
                DatePicker("", selection: $experience.startDate, displayedComponents: .date)
            }
        }
        .padding(.bottom, 10)
    }
}
