import SwiftUI

struct BriefcaseView: View {
    @State private var showSearchBar = false
    @State private var selectedJobType = "Job Type"
    @State private var selectedLocation = "Location"
    @State private var selectedIndustry = "Industry"
    @State private var selectedExperience = "Experience Level"
    @State private var selectedSalaryRange = "Salary Range"
    @State private var selectedEducation = "Education Level"
    @State private var selectedCompanySize = "Company Size"
    @State private var selectedRemoteOnsite = "Remote/On-site"
    @State private var selectedJobCategory = "Job Category"
    @State private var selectedDatePosted = "Date Posted"
    
    var jobTypes = ["Full-time", "Part-time", "Contract", "Temporary", "Internship"]
    var locations = ["New York", "Los Angeles", "San Francisco"]
    var industries = ["IT", "Healthcare", "Education", "Finance", "Hospitality", "Arts & Entertainment", "Retail", "Manufacturing", "Transportation"]
    var experienceLevels = ["Entry Level", "Mid Level", "Senior Level", "Manager", "Director"]
    var salaryRanges = ["<$50,000", "$50,000-$100,000", "$100,000-$150,000"]
    var educationLevels = ["No Education", "High School", "Associate's Degree", "Bachelor's Degree", "Master's Degree", "Doctorate"]
    var companySizes = ["Small (1-50 employees)", "Medium (51-200 employees)", "Large (200+ employees)"]
    var remoteOnsiteOptions = ["Remote", "On-site", "Hybrid"]
    var jobCategories = ["Software Engineer", "Data Scientist", "Teacher", "Nurse", "Marketing Manager", "Server", "Cleaner", "Musician", "Dancer", "IT", "Doctor"]
    var datePostedOptions = ["Last 24 hours", "Last 7 days", "Last 30 days"]
    
    // Function to generate Indeed job search URL based on selected criteria
    func generateIndeedURL() -> URL? {
        let baseURL = "https://www.indeed.com/jobs"
        var components = URLComponents(string: baseURL)
        
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "q", value: selectedJobType))
        queryItems.append(URLQueryItem(name: "l", value: selectedLocation))
        queryItems.append(URLQueryItem(name: "ind", value: selectedIndustry))
        queryItems.append(URLQueryItem(name: "explvl", value: selectedExperience))
        queryItems.append(URLQueryItem(name: "salary", value: selectedSalaryRange))
        queryItems.append(URLQueryItem(name: "edu", value: selectedEducation))
        queryItems.append(URLQueryItem(name: "csize", value: selectedCompanySize))
        queryItems.append(URLQueryItem(name: "remote", value: selectedRemoteOnsite))
        queryItems.append(URLQueryItem(name: "cat", value: selectedJobCategory))
        queryItems.append(URLQueryItem(name: "fromage", value: selectedDatePosted))
        
        components?.queryItems = queryItems
        
        return components?.url
    }
    
    // Function to generate LinkedIn job search URL based on selected criteria
    func generateLinkedInURL() -> URL? {
        // Replace with LinkedIn URL generation logic based on selected criteria
        // Example: Constructing LinkedIn URL with selected criteria
        // For demonstration, we'll use a placeholder URL
        let linkedInURLString = "https://www.linkedin.com/jobs/search?"
        let encodedCriteria = "\(selectedJobType)+\(selectedLocation)"
        let fullURLString = linkedInURLString + encodedCriteria
        
        return URL(string: fullURLString)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Job Search")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showSearchBar.toggle()
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding()
                    }
                }
                
                if showSearchBar {
                    TextField("Search", text: .constant(""))
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                }
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Job Type")
                            Picker("Job Type", selection: $selectedJobType) {
                                ForEach(jobTypes, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Location")
                            Picker("Location", selection: $selectedLocation) {
                                ForEach(locations, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Industry")
                            Picker("Industry", selection: $selectedIndustry) {
                                ForEach(industries, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Experience Level")
                            Picker("Experience Level", selection: $selectedExperience) {
                                ForEach(experienceLevels, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Salary Range")
                            Picker("Salary Range", selection: $selectedSalaryRange) {
                                ForEach(salaryRanges, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Education Level")
                            Picker("Education Level", selection: $selectedEducation) {
                                ForEach(educationLevels, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Company Size")
                            Picker("Company Size", selection: $selectedCompanySize) {
                                ForEach(companySizes, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Remote/On-site")
                            Picker("Remote/On-site", selection: $selectedRemoteOnsite) {
                                ForEach(remoteOnsiteOptions, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Job Category")
                            Picker("Job Category", selection: $selectedJobCategory) {
                                ForEach(jobCategories, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                        
                        HStack {
                            Text("Date Posted")
                            Picker("Date Posted", selection: $selectedDatePosted) {
                                ForEach(datePostedOptions, id: \.self) { Text($0) }
                            }
                            .pickerStyle(MenuPickerStyle())
                        }
                    }
                    .padding(.horizontal) // Adjust horizontal padding
                    
                    .padding(.bottom)
                    
                    Spacer()
                    
                    HStack {
                        Button("Search on Indeed") {
                            if let url = generateIndeedURL() {
                                UIApplication.shared.open(url)
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        
                        Button("Search on LinkedIn") {
                            if let url = generateLinkedInURL() {
                                UIApplication.shared.open(url)
                            }
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .padding(.bottom)
                    
                    NavigationLink(destination: ResumeBuilderView()) {
                        Text("Resume Builder")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.bottom)
                }
            }
            //.navigationBarTitle("Job Search", displayMode: .inline) // Set navigation title
        }
    }
}


struct BriefcaseView_Previews: PreviewProvider {
    static var previews: some View {
        BriefcaseView()
    }
}
