import SwiftUI
import MapKit

// MARK: - Models

struct UserProfile {
    let name: String
    let matriculationNumber: String
    let program: String
    let email: String
    let campus: String
}

struct TimetableEntry: Identifiable {
    let id = UUID()
    let title: String
    let start: String
    let end: String
    let location: String
}

struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let priceStudent: Double
    let priceStaff: Double
    let isVegan: Bool
    let isVegetarian: Bool
}

// Grades
struct CourseGrade: Identifiable {
    let id = UUID()
    let course: String
    let grade: Double
    let semester: String
}

// Campus circle / events categories
enum CampusCategory: String, CaseIterable, Identifiable {
    case food = "Food"
    case cafes = "Cafés"
    case study = "Study"
    case sports = "Sports"
    case social = "Social"
    case creativity = "Creativity"
    case itRobotics = "IT & Robotics"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .food:       return "fork.knife"
        case .cafes:      return "cup.and.saucer.fill"
        case .study:      return "book.closed.fill"
        case .sports:     return "sportscourt"
        case .social:     return "person.3.fill"
        case .creativity: return "paintpalette.fill"
        case .itRobotics: return "cpu.fill"
        }
    }

    var sectionTitle: String {
        switch self {
        case .food:       return "Food nights & socials"
        case .cafes:      return "Cafés & hangouts"
        case .study:      return "Study groups & workshops"
        case .sports:     return "Sports meetups"
        case .social:     return "Social nights"
        case .creativity: return "Creativity & art"
        case .itRobotics: return "IT & robotics events"
        }
    }
}

struct CampusEvent: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var date: Date
    var time: String
    var location: String
    var description: String
    var isOfficial: Bool
    var latitude: Double
    var longitude: Double
    var joinedCount: Int
    var isJoined: Bool

    // Extra fields for Campus circle
    var category: CampusCategory = .social
    var tags: [String] = []
    var priceText: String? = nil
}

struct HeatmapZone: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let category: String
    let latitude: Double
    let longitude: Double
    let activityLevel: Double
    let openness: Double
}

struct Quest: Identifiable {
    let id = UUID()
    let title: String
    let xp: Int
    let reward: String
    var isCompleted: Bool
}

struct BuddySuggestion: Identifiable {
    let id = UUID()
    let name: String
    let country: String
    let program: String
    let matchType: String
    let languages: String
    let distance: String
    let highlight: String
}

struct NavigatorTip: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let detail: String
}

// For stars tab
struct CampusStar: Identifiable {
    let id = UUID()
    let name: String
    let points: Int
    let rank: Int
    let emoji: String
}

struct Mission: Identifiable {
    let id = UUID()
    let day: String
    let title: String
    let points: Int
    var done: Bool
}

// Friends / chat

struct Friend: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let major: String
    let location: String
    let lastSeen: String
}

struct FriendRequest: Identifiable {
    let id = UUID()
    let name: String
    let major: String
    let details: String
}

// MARK: - Theme

enum ThemeMode: String, CaseIterable, Identifiable {
    case system, light, dark
    var id: String { rawValue }

    var label: String {
        switch self {
        case .system: return "System"
        case .light:  return "Light"
        case .dark:   return "Dark"
        }
    }

    var colorScheme: ColorScheme? {
        switch self {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }

    var background: Color {
        switch self {
        case .dark:   return Color.black.opacity(0.95)
        case .light,
             .system: return Color(white: 0.97)
        }
    }

    var cardBackground: Color {
        switch self {
        case .dark:   return Color.white.opacity(0.06)
        case .light,
             .system: return Color.white
        }
    }

    var secondaryText: Color {
        Color.secondary
    }
}

// MARK: - Demo Data

struct DemoData {
    static let profile = UserProfile(
        name: "Eyas Sakran",
        matriculationNumber: "1234567",
        program: "B.Sc. Information Engineering",
        email: "Eyas.Sakran@mytum.de",
        campus: "TUM Campus Heilbronn"
    )

    static let tuitionFees: Double = 97.0

    static let todayTimetable: [TimetableEntry] = [
        TimetableEntry(
            title: "IN0001 – Einführung in die Informatik",
            start: "10:15",
            end: "11:45",
            location: "HN-G C.0.50"
        ),
        TimetableEntry(
            title: "Algorithmen & Datenstrukturen",
            start: "14:15",
            end: "16:00",
            location: "HN-G C.1.10"
        )
    ]

    static let meals: [Meal] = [
            Meal(name: "Veganes Curry mit Reis",
                 priceStudent: 3.20,
                 priceStaff: 5.60,
                 isVegan: true,
                 isVegetarian: true),
            Meal(name: "Schokopudding mit frischer Frucht",
                 priceStudent: 0.90,
                 priceStaff: 1.80,
                 isVegan: false,
                 isVegetarian: true),
            Meal(name: "Sahnejoghurtcreme mit Walnüssen",
                 priceStudent: 0.90,
                 priceStaff: 1.80,
                 isVegan: false,
                 isVegetarian: true),

            Meal(name: "Pasta Bolognese",
                 priceStudent: 3.80,
                 priceStaff: 6.20,
                 isVegan: false,
                 isVegetarian: false),
            Meal(name: "Pizza Margherita",
                 priceStudent: 3.50,
                 priceStaff: 5.90,
                 isVegan: false,
                 isVegetarian: true),
            Meal(name: "Falafel Bowl mit Hummus",
                 priceStudent: 3.90,
                 priceStaff: 6.40,
                 isVegan: true,
                 isVegetarian: true),
            Meal(name: "Chicken Curry mit Gemüse",
                 priceStudent: 4.10,
                 priceStaff: 6.80,
                 isVegan: false,
                 isVegetarian: false),
            Meal(name: "Gemischter Salat mit Feta",
                 priceStudent: 2.80,
                 priceStaff: 4.90,
                 isVegan: false,
                 isVegetarian: true),
            Meal(name: "Tomatensuppe mit Brot",
                 priceStudent: 1.90,
                 priceStaff: 3.60,
                 isVegan: true,
                 isVegetarian: true)
        ]

    // Grades for Home tab
    static let grades: [CourseGrade] = [
        CourseGrade(course: "Grundlagen: Algorithmen und Datenstrukturen", grade: 4.0, semester: "SS 2025"),
        CourseGrade(course: "Einführung in die Softwaretechnik", grade: 5.0, semester: "SS 2025"),
        CourseGrade(course: "Lineare Algebra", grade: 3.3, semester: "WS 2024/25"),
        CourseGrade(course: "Analysis I", grade: 3.7, semester: "WS 2024/25"),
        CourseGrade(course: "Diskrete Strukturen", grade: 2.0, semester: "WS 2024/25")
    ]

    static var averageGrade: Double {
        let sum = grades.map { $0.grade }.reduce(0, +)
        return sum / Double(grades.count)
    }

    // Calendar events (used in Calendar tab)
    static func events() -> [CampusEvent] {
        let cal = Calendar.current
        let today = Date()
        func day(_ offset: Int) -> Date {
            cal.date(byAdding: .day, value: offset, to: today) ?? today
        }

        return [
            CampusEvent(
                title: "Study Jam – Analysis I",
                date: day(0),
                time: "18:00",
                location: "HN-G Learning Area",
                description: "Open study session for Analysis. Bring questions + laptop.",
                isOfficial: false,
                latitude: 49.1422,
                longitude: 9.2195,
                joinedCount: 3,
                isJoined: false
            ),
            CampusEvent(
                title: "Board Games & Pizza Night",
                date: day(1),
                time: "19:30",
                location: "Campus Lounge",
                description: "Chill evening with games, pizza and new people.",
                isOfficial: true,
                latitude: 49.1426,
                longitude: 9.2200,
                joinedCount: 8,
                isJoined: false
            ),
            CampusEvent(
                title: "Campus Tour for New Students",
                date: day(0),
                time: "14:00",
                location: "HN-G main entrance",
                description: "Quick tour around lecture halls, study spaces and printers.",
                isOfficial: true,
                latitude: 49.1420,
                longitude: 9.2188,
                joinedCount: 15,
                isJoined: false
            )
        ]
    }

    // Campus circle items (used in ExploreTab)
    static func campusCircleEvents() -> [CampusEvent] {
        let today = Date()

        return [
            // FOOD
            CampusEvent(
                title: "Pizza Night",
                date: today,
                time: "18:00–20:30",
                location: "Mensa Bildungscampus",
                description: "Shared pizza night at Mensa with veggie and vegan options.",
                isOfficial: true,
                latitude: 49.1423,
                longitude: 9.2197,
                joinedCount: 3,
                isJoined: false,
                category: .food,
                tags: ["Food", "Social"],
                priceText: "€3–5"
            ),
            CampusEvent(
                title: "Ice Cream Social",
                date: today,
                time: "16:00–18:00",
                location: "Mensa Terrace",
                description: "Ice cream, music and meeting new students.",
                isOfficial: false,
                latitude: 49.14225,
                longitude: 9.2198,
                joinedCount: 7,
                isJoined: false,
                category: .food,
                tags: ["Dessert", "Mensa"],
                priceText: "Free"
            ),

            // CAFÉS
            CampusEvent(
                title: "Café Study Hangout",
                date: today,
                time: "14:00–17:00",
                location: "Café Einstein",
                description: "Quiet tables reserved for light group study with coffee.",
                isOfficial: false,
                latitude: 49.1424,
                longitude: 9.2196,
                joinedCount: 5,
                isJoined: false,
                category: .cafes,
                tags: ["Café", "Chill"],
                priceText: nil
            ),

            // STUDY
            CampusEvent(
                title: "Group Study Session",
                date: today,
                time: "18:00–20:00",
                location: "HN-G 3rd floor study rooms",
                description: "Bring your Analysis / ADS questions and work together.",
                isOfficial: false,
                latitude: 49.1420,
                longitude: 9.2191,
                joinedCount: 4,
                isJoined: false,
                category: .study,
                tags: ["Study group"],
                priceText: nil
            ),
            CampusEvent(
                title: "Coding Workshop",
                date: today,
                time: "19:00–21:00",
                location: "Computer Lab HN-G",
                description: "Hands-on intro to Git, GitHub and basic app structure.",
                isOfficial: true,
                latitude: 49.14205,
                longitude: 9.2192,
                joinedCount: 12,
                isJoined: false,
                category: .study,
                tags: ["Workshop", "Coding"],
                priceText: nil
            ),

            // SPORTS
            CampusEvent(
                title: "Volleyball Meet",
                date: today,
                time: "20:00–22:00",
                location: "Campus Sports Hall",
                description: "Casual volleyball games, all levels welcome.",
                isOfficial: false,
                latitude: 49.1426,
                longitude: 9.22,
                joinedCount: 10,
                isJoined: false,
                category: .sports,
                tags: ["Sports"],
                priceText: nil
            ),
            CampusEvent(
                title: "Football Match",
                date: today,
                time: "18:30–20:00",
                location: "Outdoor Pitch",
                description: "Friendly campus football match, bring your friends.",
                isOfficial: false,
                latitude: 49.1427,
                longitude: 9.2201,
                joinedCount: 14,
                isJoined: false,
                category: .sports,
                tags: ["Sports"],
                priceText: nil
            ),

            // SOCIAL
            CampusEvent(
                title: "Board Games Night",
                date: today,
                time: "19:30–23:00",
                location: "Campus Lounge",
                description: "Card games, board games and snacks.",
                isOfficial: true,
                latitude: 49.1428,
                longitude: 9.2199,
                joinedCount: 16,
                isJoined: false,
                category: .social,
                tags: ["Social", "Free"],
                priceText: nil
            ),
            CampusEvent(
                title: "Movie Games Night",
                date: today,
                time: "20:00–23:30",
                location: "Audimax",
                description: "Party games plus movie quiz on big screen.",
                isOfficial: false,
                latitude: 49.1429,
                longitude: 9.2194,
                joinedCount: 11,
                isJoined: false,
                category: .social,
                tags: ["Social"],
                priceText: nil
            ),
            CampusEvent(
                title: "Karaoke Night",
                date: today,
                time: "21:00–00:00",
                location: "Campus Bar",
                description: "Pick a song and sing – no talent required.",
                isOfficial: false,
                latitude: 49.1430,
                longitude: 9.2193,
                joinedCount: 9,
                isJoined: false,
                category: .social,
                tags: ["Social", "Music"],
                priceText: nil
            ),

            // CREATIVITY
            CampusEvent(
                title: "Arts & Chill",
                date: today,
                time: "17:00–19:00",
                location: "Design Studio",
                description: "Drawing, painting, sketching – materials provided.",
                isOfficial: false,
                latitude: 49.1421,
                longitude: 9.2199,
                joinedCount: 6,
                isJoined: false,
                category: .creativity,
                tags: ["Art", "Relax"],
                priceText: nil
            ),
            CampusEvent(
                title: "Photography Walk",
                date: today,
                time: "16:30–18:30",
                location: "Meet at main entrance",
                description: "Golden hour walk around Heilbronn – phones welcome.",
                isOfficial: false,
                latitude: 49.14215,
                longitude: 9.2190,
                joinedCount: 8,
                isJoined: false,
                category: .creativity,
                tags: ["Photography"],
                priceText: nil
            ),

            // IT & ROBOTICS
            CampusEvent(
                title: "Robotics Workshop",
                date: today,
                time: "15:00–18:00",
                location: "Robotics Lab",
                description: "Build and program a simple line-following robot.",
                isOfficial: true,
                latitude: 49.14218,
                longitude: 9.2189,
                joinedCount: 13,
                isJoined: false,
                category: .itRobotics,
                tags: ["Robotics", "Hands-on"],
                priceText: nil
            ),
            CampusEvent(
                title: "Hackathon Sprint",
                date: today,
                time: "18:00–02:00",
                location: "HN-G Project Rooms",
                description: "Mini overnight hackathon – form teams on-site.",
                isOfficial: true,
                latitude: 49.14219,
                longitude: 9.2187,
                joinedCount: 20,
                isJoined: false,
                category: .itRobotics,
                tags: ["Hackathon", "Coding"],
                priceText: nil
            )
        ]
    }

    // Friends list for Home > Friends
    static let friends: [Friend] = [
        Friend(name: "Maria K.",  major: "Informatics",    location: "Dorms · 3 min",       lastSeen: "Online"),
        Friend(name: "Omar S.",   major: "BIE",            location: "HN-G · 1st floor",    lastSeen: "5 min ago"),
        Friend(name: "Jin Woo",   major: "Robotics",       location: "Library · Silent",    lastSeen: "10 min ago"),
        Friend(name: "Noura A.",  major: "BMDS",           location: "Campus Lounge",       lastSeen: "1 h ago"),
        Friend(name: "Lucas T.",  major: "Mathematics",    location: "Sports Hall",         lastSeen: "Today"),
        Friend(name: "Aya R.",    major: "Architecture",   location: "Café Einstein",       lastSeen: "Today"),
        Friend(name: "Hassan M.", major: "Informatics",    location: "Dorms · 2 min",       lastSeen: "Online"),
        Friend(name: "Elena V.",  major: "Management",     location: "Campus Lounge",       lastSeen: "Yesterday"),
        Friend(name: "Rami L.",   major: "BIE",            location: "Library · 2nd floor", lastSeen: "Today"),
        Friend(name: "Chiara P.", major: "Psychology",     location: "Mensa",               lastSeen: "3 h ago")
    ]

    static let friendRequests: [FriendRequest] = [
        FriendRequest(name: "Lea M.",   major: "Informatics",  details: "Same Algorithms group · Library 2nd floor"),
        FriendRequest(name: "Tariq H.", major: "BIE",          details: "Joined your last Study Jam · HN-G"),
        FriendRequest(name: "Marta S.", major: "BMDS",         details: "Met at Board Games Night · Campus Lounge"),
        FriendRequest(name: "Yusuf A.", major: "Mathematics",  details: "Plays volleyball on Fridays · Sports hall")
    ]

    // Buddy suggestions (not shown on Home anymore, but kept as demo data)
    static let buddySuggestions: [BuddySuggestion] = [
        BuddySuggestion(
            name: "Sara A.",
            country: "Germany",
            program: "B.Sc. Information Engineering",
            matchType: "High match",
            languages: "German, English",
            distance: "120 m · HN-G",
            highlight: "Also loves late-night study sessions and Mensa curry."
        ),
        BuddySuggestion(
            name: "Omar T.",
            country: "Jordan",
            program: "B.Sc. BMDS",
            matchType: "Study buddy",
            languages: "Arabic, English",
            distance: "Dorms · 3 min",
            highlight: "Same Algorithms lecture and often in the library evenings."
        ),
        BuddySuggestion(
            name: "Lena P.",
            country: "Germany",
            program: "Management & Technology",
            matchType: "Event buddy",
            languages: "German, English",
            distance: "Campus lounge",
            highlight: "Goes to most student events and board game nights."
        ),
        BuddySuggestion(
            name: "Yuki H.",
            country: "Japan",
            program: "Informatics",
            matchType: "Gaming + study",
            languages: "Japanese, English",
            distance: "E-sports room",
            highlight: "Loves co-op games and exam prep in groups."
        ),
        BuddySuggestion(
            name: "Noor D.",
            country: "Lebanon",
            program: "Architecture",
            matchType: "New on campus",
            languages: "Arabic, English",
            distance: "Studio · 2nd floor",
            highlight: "Looking for people to explore Heilbronn and campus cafés."
        )
    ]
}

// MARK: - Utilities

func initials(from name: String) -> String {
    let parts = name.split(separator: " ")
    let first = parts.first?.first.map(String.init) ?? ""
    let second = parts.dropFirst().first?.first.map(String.init) ?? ""
    let combined = first + second
    return combined.isEmpty ? "ST" : combined.uppercased()
}

// Allow Map to use center coordinate as annotation item
extension CLLocationCoordinate2D: Identifiable {
    public var id: String { "\(latitude)-\(longitude)" }
}

// MARK: - Root

struct ContentView: View {
    @State private var themeMode: ThemeMode = .dark
    @State private var selectedTab: Int = 0
    @State private var isLoggedIn: Bool = false

    var body: some View {
        if isLoggedIn {
            ZStack {
                themeMode.background.ignoresSafeArea()

                TabView(selection: $selectedTab) {
                    HomeTab(theme: $themeMode, selectedTab: $selectedTab)
                        .tabItem { Label("Home", systemImage: "house.fill") }
                        .tag(0)

                    CalendarTab(theme: $themeMode)
                        .tabItem { Label("Calendar", systemImage: "calendar") }
                        .tag(1)

                    ExploreTab(theme: $themeMode)
                        .tabItem { Label("Campus", systemImage: "map.circle") }
                        .tag(2)

                    StarsTab(theme: $themeMode)
                        .tabItem { Label("Stars", systemImage: "star.fill") }
                        .tag(3)

                    ProfileTab(theme: $themeMode)
                        .tabItem { Label("Connect", systemImage: "person.crop.circle") }
                        .tag(4)
                }
                .accentColor(.blue)
                .preferredColorScheme(themeMode.colorScheme)
            }
        } else {
            AuthView {
                withAnimation {
                    isLoggedIn = true
                }
            }
        }
    }
}

// MARK: - Home Tab

struct HomeTab: View {
    @Binding var theme: ThemeMode
    @Binding var selectedTab: Int

    private let profile = DemoData.profile
    private let fees = DemoData.tuitionFees
    private let meals = DemoData.meals
    private let timetable = DemoData.todayTimetable

    @State private var showMensaSheet = false
    @State private var showStudyRoomsSheet = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {

                    // Top bar
                    HStack {
                        Image(systemName: "magnifyingglass")

                        Spacer()

                        Text("TUM")
                            .font(.title2.bold())
                            .foregroundColor(.blue)

                        Spacer()

                        HStack(spacing: 16) {
                            NavigationLink {
                                FriendsView(theme: theme)
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(Color.black.opacity(0.2))
                                        .frame(width: 40, height: 32)
                                    Image(systemName: "person.3.fill")
                                        .font(.system(size: 16, weight: .semibold))
                                }
                            }

                            NavigationLink {
                                SettingsView(theme: $theme)
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .font(.system(size: 18))
                    .padding(.horizontal)

                    // Profile card -> Student card
                    NavigationLink {
                        ProfileDetailView(theme: theme, profile: profile)
                    } label: {
                        HStack(spacing: 16) {
                            ZStack {
                                Circle()
                                    .fill(LinearGradient(
                                        colors: [.blue, .purple],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ))
                                    .frame(width: 56, height: 56)
                                Text(initials(from: profile.name))
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }

                            VStack(alignment: .leading, spacing: 4) {
                                Text(profile.name)
                                    .font(.headline)
                                Text(profile.program)
                                    .font(.footnote)
                                    .foregroundColor(theme.secondaryText)
                                Text("Matriculation: \(profile.matriculationNumber)")
                                    .font(.footnote)
                                    .foregroundColor(theme.secondaryText)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(theme.cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: theme == .dark ? 0 : 4)
                        .padding(.horizontal)
                    }
                    .buttonStyle(.plain)

                    // Tuition & quick actions
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tuition fees")
                                .font(.subheadline)
                            Text(String(format: "%.2f €", fees))
                                .font(.headline)
                                .foregroundColor(.red)
                            Text("Next semester fee")
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)
                        }
                        .padding()
                        .background(theme.cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: theme == .dark ? 0 : 3)

                        VStack(spacing: 8) {
                            QuickChip(icon: "graduationcap", label: "Study rooms") {
                                showStudyRoomsSheet = true
                            }

                            Button {
                                showMensaSheet = true
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: "fork.knife")
                                    Text("Mensa")
                                        .font(.caption)
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    RoundedRectangle(cornerRadius: 999, style: .continuous)
                                        .fill(Color.blue.opacity(0.15))
                                )
                            }
                            .buttonStyle(.plain)

                            QuickChip(icon: "sparkles", label: "Social quests") {
                                selectedTab = 3
                            }
                        }
                    }
                    .padding(.horizontal)

                    // Today schedule
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Today on campus")
                            .font(.subheadline.bold())

                        ForEach(timetable) { entry in
                            TimetableRow(entry: entry, theme: theme)
                        }
                    }
                    .padding()
                    .background(theme.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: theme == .dark ? 0 : 3)
                    .padding(.horizontal)

                    // Grades overview (replaces AI Buddy Matchmaking)
                    GradesOverviewCard(
                        grades: DemoData.grades,
                        average: DemoData.averageGrade,
                        theme: theme
                    )
                    .padding(.horizontal)

                    Spacer(minLength: 16)
                }
                .padding(.top, 12)
            }
            .background(theme.background.ignoresSafeArea())
            .navigationTitle("Home")
            .sheet(isPresented: $showMensaSheet) {
                NavigationStack {
                    MensaView(theme: theme)
                }
            }
            .sheet(isPresented: $showStudyRoomsSheet) {
                NavigationStack {
                    StudyRoomsView(theme: theme)
                }
            }
        }
    }
}

struct QuickChip: View {
    let icon: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                Text(label)
                    .font(.caption)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                RoundedRectangle(cornerRadius: 999, style: .continuous)
                    .fill(Color.blue.opacity(0.15))
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Mensa / Study rooms

struct MealCard: View {
    let meal: Meal
    let theme: ThemeMode

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(meal.name)
                .font(.footnote.bold())
                .lineLimit(2)
            Text(String(format: "Students: €%.2f", meal.priceStudent))
                .font(.caption)
                .foregroundColor(theme.secondaryText)
            if meal.isVegan {
                badge(text: "Vegan")
            } else if meal.isVegetarian {
                badge(text: "Vegetarian")
            }
        }
        .padding()
        .frame(width: 200, alignment: .leading)
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: theme == .dark ? 0 : 2)
    }

    private func badge(text: String) -> some View {
        Text(text)
            .font(.caption2)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(Color.green.opacity(0.2))
            .clipShape(Capsule())
    }
}

struct MensaView: View {
    let theme: ThemeMode
    private let meals = DemoData.meals

    var body: some View {
        List {
            ForEach(meals) { meal in
                HStack(spacing: 12) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .fill(
                                LinearGradient(
                                    colors: [Color.orange, Color.pink],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 52, height: 52)
                        Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                            .foregroundColor(.white)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(meal.name)
                            .font(.subheadline.bold())
                        Text(String(format: "Students: €%.2f   Staff: €%.2f",
                                    meal.priceStudent, meal.priceStaff))
                            .font(.caption)
                            .foregroundColor(theme.secondaryText)

                        HStack {
                            if meal.isVegan {
                                badge(text: "Vegan")
                            } else if meal.isVegetarian {
                                badge(text: "Vegetarian")
                            }
                            Text("Mensa Bildungscampus")
                                .font(.caption2)
                                .foregroundColor(theme.secondaryText)
                        }
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Mensa menu")
    }

    private func badge(text: String) -> some View {
        Text(text)
            .font(.caption2)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(Color.green.opacity(0.2))
            .clipShape(Capsule())
    }
}

struct StudyRoomsView: View {
    let theme: ThemeMode

    private let totalRooms = 12
    private let availableRooms = 5

    // fake per-area data just for visuals
    private let areas: [(name: String, detail: String, free: Int, total: Int, icon: String)] = [
        ("Silent zone", "Best for deep work & exams prep.", 2, 4, "moon.stars.fill"),
        ("Group rooms", "Whiteboards & screens for projects.", 2, 5, "person.3.fill"),
        ("Open space", "More relaxed, light background noise.", 1, 3, "dot.radiowaves.left.and.right")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Title
                VStack(alignment: .leading, spacing: 6) {
                    Text("Live availability of study spaces right now.")
                        .font(.footnote)
                        .foregroundColor(theme.secondaryText)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                // Main card
                VStack(alignment: .leading, spacing: 16) {
                    Text("Right now on campus")
                        .font(.headline)

                    HStack(alignment: .firstTextBaseline, spacing: 10) {
                        Text("\(availableRooms)")
                            .font(.system(size: 44, weight: .bold, design: .rounded))
                            .foregroundColor(.green)

                        VStack(alignment: .leading, spacing: 4) {
                            Text("rooms free")
                                .font(.subheadline.bold())

                            Text("out of \(totalRooms) bookable rooms")
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)
                        }
                    }

                    ProgressView(value: Double(availableRooms),
                                 total: Double(totalRooms))
                        .tint(.green)
                        .padding(.top, 4)

                    HStack(spacing: 10) {
                        Label("Quiet = good focus", systemImage: "checkmark.circle.fill")
                            .font(.caption2)
                        Spacer()
                        Label("Busy = might need to search", systemImage: "exclamationmark.triangle.fill")
                            .font(.caption2)
                    }
                    .foregroundColor(theme.secondaryText)
                }
                .padding()
                .background(
                    LinearGradient(
                        colors: [Color.green.opacity(0.25), theme.cardBackground],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .shadow(radius: theme == .dark ? 0 : 4)

                // List of areas
                VStack(alignment: .leading, spacing: 14) {
                    Text("Where should I go?")
                        .font(.headline)

                    ForEach(0..<areas.count, id: \.self) { index in
                        let area = areas[index]
                        StudyAreaRow(area: area, theme: theme)
                    }
                }
                .padding()
                .background(theme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
                .shadow(radius: theme == .dark ? 0 : 3)
            }
            .padding()
        }
        .background(theme.background.ignoresSafeArea())
        .navigationTitle("Study rooms")
    }
}

// MARK: - Sub Row Component
struct StudyAreaRow: View {
    let area: (name: String, detail: String, free: Int, total: Int, icon: String)
    let theme: ThemeMode

    private var occupancyColor: Color {
        let ratio = Double(area.free) / Double(area.total)
        if ratio <= 0.2 { return .red }
        if ratio <= 0.5 { return .orange }
        return .green
    }

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(occupancyColor.opacity(0.2))
                    .frame(width: 52, height: 52)

                Image(systemName: area.icon)
                    .font(.title3)
                    .foregroundColor(occupancyColor)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(area.name)
                    .font(.subheadline.bold())

                Text(area.detail)
                    .font(.caption2)
                    .foregroundColor(theme.secondaryText)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 4) {
                Text("\(area.free) / \(area.total) free")
                    .font(.caption.bold())
                    .foregroundColor(occupancyColor)

                Capsule()
                    .fill(occupancyColor.opacity(0.5))
                    .frame(width: 60, height: 4)
            }
        }
        .padding(10)
        .background(theme.cardBackground.opacity(0.95))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}


// MARK: - Grades overview card (Home)

struct GradesOverviewCard: View {
    let grades: [CourseGrade]
    let average: Double
    let theme: ThemeMode

    private let maxBarHeight: CGFloat = 140

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Studies")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                    Text("Information Engineering (Heilbronn) (B.Sc.)")
                        .font(.subheadline.bold())
                }
                Spacer()
            }

            // Simple bar chart
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(grades) { item in
                        VStack(spacing: 4) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(barColor(for: item.grade))
                                .frame(
                                    width: 18,
                                    height: barHeight(for: item.grade)
                                )

                            Text(String(format: "%.1f", item.grade))
                                .font(.caption2)
                                .foregroundColor(theme.secondaryText)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                HStack {
                    Text("Average Grade")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                    Spacer()
                    Text(String(format: "%.2f", average))
                        .font(.headline)
                }
            }

            Divider()

            // List of courses
            VStack(alignment: .leading, spacing: 8) {
                ForEach(grades) { item in
                    HStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(barColor(for: item.grade))
                            .frame(width: 26, height: 26)
                            .overlay(
                                Text(String(format: "%.1f", item.grade))
                                    .font(.caption.bold())
                                    .foregroundColor(.white)
                            )

                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.course)
                                .font(.caption)
                            Text(item.semester)
                                .font(.caption2)
                                .foregroundColor(theme.secondaryText)
                        }

                        Spacer()
                    }
                }
            }
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: theme == .dark ? 0 : 3)
    }

    private func barHeight(for grade: Double) -> CGFloat {
        // TUM scale 1.0 (best) to 5.0 (worst)
        // Higher grade -> taller bar like in screenshot
        let minGrade = 1.0
        let maxGrade = 5.0
        let clamped = min(max(grade, minGrade), maxGrade)
        let ratio = (clamped - minGrade) / (maxGrade - minGrade)
        return CGFloat(0.4 + ratio * 0.6) * maxBarHeight
    }

    private func barColor(for grade: Double) -> Color {
        switch grade {
        case ..<1.7: return Color.green
        case ..<3.0: return Color.yellow
        case ..<3.7: return Color.orange
        default:     return Color.red
        }
    }
}

// MARK: - Calendar Tab

struct CalendarTab: View {
    @Binding var theme: ThemeMode

    // Demo data
    private let timetable = DemoData.todayTimetable
    private let events = DemoData.events()

    // 0 = Day, 1 = Week, 2 = Month
    @State private var mode: Int = 0
    @State private var displayedMonth: Date = Date()
    @State private var selectedDate: Date = Date()

    private let calendar = Calendar.current
    private let firstHour = 8
    private let lastHour = 20

    // MARK: Computed helpers

    private var isTodaySelected: Bool {
        calendar.isDateInToday(selectedDate)
    }

    private var eventsForSelectedDate: [CampusEvent] {
        events.filter { calendar.isDate($0.date, inSameDayAs: selectedDate) }
    }

    private var lecturesForSelectedDate: [TimetableEntry] {
        isTodaySelected ? timetable : []
    }

    /// Monday-based start of the week
    private var weekStart: Date {
        let comps = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: selectedDate)
        return calendar.date(from: comps) ?? selectedDate
    }

    private var weekRangeTitle: String {
        let endOfWeek = calendar.date(byAdding: .day, value: 4, to: weekStart) ?? weekStart
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d"
        let start = formatter.string(from: weekStart)
        let end = formatter.string(from: endOfWeek)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: weekStart)
        return "\(start) – \(end) \(year)"
    }

    private var monthTitle: String {
        let f = DateFormatter()
        f.dateFormat = "LLLL yyyy"
        return f.string(from: displayedMonth)
    }

    private var daysInMonth: [MonthDay] {
        generateMonthDays(for: displayedMonth)
    }

    // Items used in the DAY view (lectures + events merged and sorted)
    private var dayItems: [DayScheduleItem] {
        var items: [DayScheduleItem] = []

        if isTodaySelected {
            for lec in timetable {
                items.append(
                    DayScheduleItem(
                        title: lec.title,
                        time: "\(lec.start) – \(lec.end)",
                        location: lec.location,
                        subtitle: "Lecture",
                        accent: .orange,
                        iconName: "book.closed"
                    )
                )
            }
        }

        for ev in eventsForSelectedDate {
            items.append(
                DayScheduleItem(
                    title: ev.title,
                    time: ev.time,
                    location: ev.location,
                    subtitle: ev.description,
                    accent: ev.isOfficial ? .blue : .green,
                    iconName: ev.isOfficial ? "calendar.badge.clock" : "person.3.fill"
                )
            )
        }

        return items.sorted { $0.time < $1.time }
    }

    // MARK: Week demo blocks (for sophisticated grid)

    // UPDATED COLORS: using .orange / .blue / .green to match day & month accents
    private let weekBlocks: [WeekEventBlock] = [
        // Monday
        WeekEventBlock(dayOffset: 0, startHour: 9,  endHour: 10,
                       title: "Plan for the week",
                       subtitle: "09:00–10:00 · Focus",
                       color: .orange),
        WeekEventBlock(dayOffset: 0, startHour: 11, endHour: 12,
                       title: "Weekly team meeting",
                       subtitle: "11:00–12:00 · HN-G C.0.50",
                       color: .blue),
        WeekEventBlock(dayOffset: 0, startHour: 13, endHour: 15,
                       title: "Deep work",
                       subtitle: "13:00–15:00 · Library",
                       color: .green),

        // Tuesday
        WeekEventBlock(dayOffset: 1, startHour: 9,  endHour: 10,
                       title: "Inbox Zero",
                       subtitle: "09:00–10:00 · Mail & admin",
                       color: .green),
        WeekEventBlock(dayOffset: 1, startHour: 10, endHour: 12,
                       title: "Record intro video",
                       subtitle: "10:00–12:00 · Project room",
                       color: .orange),
        WeekEventBlock(dayOffset: 1, startHour: 14, endHour: 16,
                       title: "Customer interview",
                       subtitle: "14:00–16:00 · Online",
                       color: .blue),

        // Wednesday
        WeekEventBlock(dayOffset: 2, startHour: 9,  endHour: 11,
                       title: "Publish video",
                       subtitle: "09:00–11:00 · YouTube",
                       color: .orange),
        WeekEventBlock(dayOffset: 2, startHour: 11, endHour: 13,
                       title: "Design review",
                       subtitle: "11:00–13:00 · Studio",
                       color: .blue),
        WeekEventBlock(dayOffset: 2, startHour: 16, endHour: 18,
                       title: "Yoga session",
                       subtitle: "16:00–18:00 · Sports hall",
                       color: .green),

        // Thursday
        WeekEventBlock(dayOffset: 3, startHour: 9,  endHour: 10,
                       title: "Breakfast with Elaine",
                       subtitle: "09:00–10:00 · Café",
                       color: .green),
        WeekEventBlock(dayOffset: 3, startHour: 10, endHour: 12,
                       title: "Monthly newsletter",
                       subtitle: "10:00–12:00 · Content",
                       color: .blue),
        WeekEventBlock(dayOffset: 3, startHour: 15, endHour: 16,
                       title: "Weekly review",
                       subtitle: "15:00–16:00 · Reflection",
                       color: .orange),

        // Friday
        WeekEventBlock(dayOffset: 4, startHour: 11, endHour: 13,
                       title: "Customer support",
                       subtitle: "11:00–13:00 · Tickets",
                       color: .blue),
        WeekEventBlock(dayOffset: 4, startHour: 18, endHour: 19,
                       title: "Dinner",
                       subtitle: "18:00–19:00 · Friends",
                       color: .green)
    ]

    // MARK: Body

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Picker("Mode", selection: $mode) {
                    Text("Day").tag(0)
                    Text("Week").tag(1)
                    Text("Month").tag(2)
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)

                Group {
                    switch mode {
                    case 0: dayView
                    case 1: weekView
                    default: monthView
                    }
                }
            }
            .background(theme.background.ignoresSafeArea())
            .navigationTitle("Calendar")
            .onChange(of: mode) { _ in
                if mode == 2 {
                    displayedMonth = selectedDate
                }
            }
        }
    }

    // MARK: - DAY VIEW

    private var dayView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {

                // Horizontal weekday chips
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        let weekDays = (0..<5).compactMap {
                            calendar.date(byAdding: .day, value: $0, to: weekStart)
                        }
                        ForEach(weekDays, id: \.self) { date in
                            DayChip(
                                date: date,
                                isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
                                isToday: calendar.isDateInToday(date),
                                theme: theme
                            )
                            .onTapGesture {
                                withAnimation(.spring(response: 0.35, dampingFraction: 0.9)) {
                                    selectedDate = date
                                    displayedMonth = date
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(dayHeaderTitle())
                        .font(.title3.bold())

                    Text("Your lectures and campus events for this day.")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                }
                .padding(.horizontal)

                if dayItems.isEmpty {
                    Text("No items yet. Check the Campus tab to discover events for this day.")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                        .padding()
                        .padding(.horizontal)
                } else {
                    VStack(spacing: 12) {
                        ForEach(dayItems) { item in
                            DayEventCard(item: item, theme: theme)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .padding(.top, 4)
        }
    }

    private func dayHeaderTitle() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        let dateString = formatter.string(from: selectedDate)

        if calendar.isDateInToday(selectedDate) {
            return "Today, \(dateString)"
        } else {
            formatter.dateFormat = "EEEE"
            let weekday = formatter.string(from: selectedDate)
            return "\(weekday), \(dateString)"
        }
    }

    // MARK: - WEEK VIEW (grid)

    private var weekView: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Upcoming")
                        .font(.title3.bold())
                    Text(weekRangeTitle)
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                }
                Spacer()
                Text("Week")
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.blue.opacity(0.12))
                    .clipShape(Capsule())
            }
            .padding(.horizontal)

            WeekGridView(
                theme: theme,
                calendar: calendar,
                weekStart: weekStart,
                selectedDate: selectedDate,
                firstHour: firstHour,
                lastHour: lastHour,
                events: weekBlocks
            )
            .padding(.horizontal)
        }
    }

    // MARK: - MONTH VIEW

    private var monthView: some View {
        VStack(spacing: 18) {

            // Month card with calendar grid
            VStack(spacing: 12) {

                HStack {
                    Button { changeMonth(by: -1) } label: {
                        Image(systemName: "chevron.left")
                    }

                    Spacer()

                    Text(monthTitle)
                        .font(.headline)

                    Spacer()

                    Button { changeMonth(by: 1) } label: {
                        Image(systemName: "chevron.right")
                    }
                }
                .font(.subheadline)

                HStack {
                    ForEach(["M","T","W","T","F","S","S"], id: \.self) { label in
                        Text(label)
                            .font(.caption2)
                            .foregroundColor(theme.secondaryText)
                            .frame(maxWidth: .infinity)
                    }
                }

                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 6), count: 7),
                    spacing: 8
                ) {
                    ForEach(daysInMonth) { day in
                        CalendarDayCircle(
                            date: day.date,
                            isInCurrentMonth: day.isInCurrentMonth,
                            isSelected: calendar.isDate(day.date, inSameDayAs: selectedDate),
                            hasEvents: events.contains { calendar.isDate($0.date, inSameDayAs: day.date) },
                            theme: theme
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.15)) {
                                selectedDate = day.date
                            }
                        }
                    }
                }
            }
            .padding(14)
            .background(theme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .shadow(radius: theme == .dark ? 0 : 4)

            // Events list below
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(isTodaySelected ? "Today" : formattedSelectedDayTitle())
                                .font(.headline)
                            Text(eventsSummaryText())
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)
                        }
                        Spacer()
                    }

                    if isTodaySelected && !timetable.isEmpty {
                        ForEach(timetable) { entry in
                            TimetableRow(entry: entry, theme: theme)
                        }
                    }

                    if eventsForSelectedDate.isEmpty {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("No events planned")
                                .font(.subheadline.bold())
                            Text("Tap the + button in the Campus tab to create your own event for this day.")
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(theme.cardBackground)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(radius: theme == .dark ? 0 : 3)
                    } else {
                        ForEach(eventsForSelectedDate) { ev in
                            EventCardSimple(event: ev, theme: theme)
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }

    // MARK: - Month helpers

    private func changeMonth(by value: Int) {
        if let newMonth = calendar.date(byAdding: .month, value: value, to: displayedMonth) {
            displayedMonth = newMonth

            if !calendar.isDate(selectedDate, equalTo: newMonth, toGranularity: .month),
               let firstOfMonth = calendar.date(
                from: calendar.dateComponents([.year, .month], from: newMonth)
               ) {
                selectedDate = firstOfMonth
            }
        }
    }

    private func formattedSelectedDayTitle() -> String {
        let f = DateFormatter()
        f.dateFormat = "EEE, d MMM"
        return f.string(from: selectedDate)
    }

    private func eventsSummaryText() -> String {
        let count = eventsForSelectedDate.count +
            (isTodaySelected ? timetable.count : 0)

        switch count {
        case 0:  return "No events or lectures yet."
        case 1:  return "1 item on this day."
        default: return "\(count) items on this day."
        }
    }

    /// Generate the grid days for the month card
    private func generateMonthDays(for baseDate: Date) -> [MonthDay] {
        var days: [MonthDay] = []

        guard
            let monthInterval = calendar.dateInterval(of: .month, for: baseDate),
            let firstOfMonth = monthInterval.start as Date?
        else { return [] }

        let range = calendar.range(of: .day, in: .month, for: firstOfMonth) ?? 1..<2

        // Monday-based leading blanks
        let firstWeekdayIndex = calendar.component(.weekday, from: firstOfMonth)
        let leadingBlankDays = (firstWeekdayIndex + 5) % 7

        if leadingBlankDays > 0 {
            if let previousMonth = calendar.date(byAdding: .month, value: -1, to: firstOfMonth),
               let prevRange = calendar.range(of: .day, in: .month, for: previousMonth) {

                let lastDayPrev = prevRange.count
                let startDay = lastDayPrev - leadingBlankDays + 1
                for day in startDay...lastDayPrev {
                    if let date = calendar.date(bySetting: .day, value: day, of: previousMonth) {
                        days.append(MonthDay(date: date, isInCurrentMonth: false))
                    }
                }
            }
        }

        for day in range {
            if let date = calendar.date(bySetting: .day, value: day, of: firstOfMonth) {
                days.append(MonthDay(date: date, isInCurrentMonth: true))
            }
        }

        // Trailing blanks to fill last row
        let remainder = days.count % 7
        if remainder != 0 {
            let trailing = 7 - remainder
            if let nextMonth = calendar.date(byAdding: .month, value: 1, to: firstOfMonth) {
                for day in 1...trailing {
                    if let date = calendar.date(bySetting: .day, value: day, of: nextMonth) {
                        days.append(MonthDay(date: date, isInCurrentMonth: false))
                    }
                }
            }
        }

        return days
    }
}

// MARK: - Calendar helpers just for CalendarTab

struct DayScheduleItem: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let location: String
    let subtitle: String?
    let accent: Color
    let iconName: String
}

struct DayChip: View {
    let date: Date
    let isSelected: Bool
    let isToday: Bool
    let theme: ThemeMode

    private let calendar = Calendar.current

    private var dayNum: Int {
        calendar.component(.day, from: date)
    }

    private var weekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: date)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(weekday)
                .font(.caption2)
            Text("\(dayNum)")
                .font(.headline)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(isSelected ? Color.blue : theme.cardBackground)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(isToday ? Color.blue.opacity(0.6) : Color.clear, lineWidth: 1.5)
        )
        .foregroundColor(isSelected ? .white : .primary)
    }
}

struct DayEventCard: View {
    let item: DayScheduleItem
    let theme: ThemeMode

    var body: some View {
        HStack(alignment: .top, spacing: 12) {

            VStack(spacing: 4) {
                Text(item.time)
                    .font(.caption.bold())
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Spacer(minLength: 0)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .background(item.accent)
            .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Image(systemName: item.iconName)
                        .font(.caption)
                    Text(item.title)
                        .font(.subheadline.bold())
                        .lineLimit(2)
                }

                Text(item.location)
                    .font(.caption)
                    .foregroundColor(theme.secondaryText)

                if let subtitle = item.subtitle, !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.caption2)
                        .foregroundColor(theme.secondaryText)
                        .lineLimit(3)
                }
            }

            Spacer()
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: theme == .dark ? 0 : 3)
    }
}

// MARK: - Week grid types

struct WeekEventBlock: Identifiable {
    let id = UUID()
    let dayOffset: Int      // 0 = Mon, 1 = Tue, ...
    let startHour: Int
    let endHour: Int
    let title: String
    let subtitle: String
    let color: Color
}

struct WeekGridView: View {
    let theme: ThemeMode
    let calendar: Calendar
    let weekStart: Date
    let selectedDate: Date
    let firstHour: Int
    let lastHour: Int
    let events: [WeekEventBlock]

    private let dayColumnWidth: CGFloat = 130
    private let timeColumnWidth: CGFloat = 52
    private let rowHeight: CGFloat = 56
    private let visibleDays: Int = 5  // Mon–Fri

    private var hours: [Int] {
        Array(firstHour...lastHour)
    }

    var body: some View {
        ScrollView([.vertical, .horizontal], showsIndicators: false) {
            VStack(spacing: 0) {
                // Header row: time column + day headers
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: timeColumnWidth, height: 32)

                    ForEach(0..<visibleDays, id: \.self) { offset in
                        let date = calendar.date(byAdding: .day, value: offset, to: weekStart) ?? weekStart
                        WeekHeaderCell(
                            date: date,
                            isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
                            isToday: calendar.isDateInToday(date),
                            width: dayColumnWidth,
                            theme: theme
                        )
                    }
                }

                Divider()
                    .overlay(Color.black.opacity(0.05))

                ForEach(hours, id: \.self) { hour in
                    HStack(spacing: 0) {
                        Text(String(format: "%02d:00", hour))
                            .font(.caption2)
                            .foregroundColor(hour == Calendar.current.component(.hour, from: Date())
                                             ? .red
                                             : theme.secondaryText)
                            .frame(width: timeColumnWidth, height: rowHeight, alignment: .topTrailing)
                            .padding(.top, 6)
                            .padding(.trailing, 4)

                        ForEach(0..<visibleDays, id: \.self) { dayIndex in
                            let date = calendar.date(byAdding: .day, value: dayIndex, to: weekStart) ?? weekStart
                            WeekEventCell(
                                event: eventFor(dayIndex: dayIndex, hour: hour),
                                isTodayColumn: calendar.isDateInToday(date),
                                theme: theme,
                                width: dayColumnWidth,
                                height: rowHeight
                            )
                        }
                    }

                    Divider()
                        .overlay(Color.black.opacity(0.03))
                }
            }
        }
        .padding(8)
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
        .shadow(radius: theme == .dark ? 0 : 4)
    }

    private func eventFor(dayIndex: Int, hour: Int) -> WeekEventBlock? {
        events
            .filter { $0.dayOffset == dayIndex && $0.startHour == hour }
            .sorted { $0.endHour > $1.endHour }
            .first
    }
}

struct WeekHeaderCell: View {
    let date: Date
    let isSelected: Bool
    let isToday: Bool
    let width: CGFloat
    let theme: ThemeMode

    private let calendar = Calendar.current

    private var day: Int {
        calendar.component(.day, from: date)
    }

    private var weekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter.string(from: date)
    }

    var body: some View {
        VStack(spacing: 4) {
            Text(weekday)
                .font(.caption2)
            HStack(spacing: 4) {
                Text("\(day)")
                    .font(.footnote.bold())
                if isToday {
                    Text("Today")
                        .font(.caption2.bold())
                        .foregroundColor(.red)
                }
            }
        }
        .frame(width: width, height: 32)
        .padding(.vertical, 4)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(isSelected ? Color.blue.opacity(0.08) : Color.clear)
        )
    }
}

struct WeekEventCell: View {
    let event: WeekEventBlock?
    let isTodayColumn: Bool
    let theme: ThemeMode
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(isTodayColumn ? Color.blue.opacity(0.02) : Color.clear)

            Rectangle()
                .stroke(Color.black.opacity(0.04), lineWidth: 0.5)

            if let event = event {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(event.color)
                    .overlay(
                        VStack(alignment: .leading, spacing: 2) {
                            Text(event.title)
                                .font(.caption2.bold())
                                .foregroundColor(.black.opacity(0.85))
                                .lineLimit(2)
                            Text(event.subtitle)
                                .font(.system(size: 9))
                                .foregroundColor(theme.secondaryText)
                                .lineLimit(1)
                        }
                        .padding(6)
                    )
                    .padding(3)
            }
        }
        .frame(width: width, height: height)
    }
}

// Month grid helpers

struct MonthDay: Identifiable {
    let id = UUID()
    let date: Date
    let isInCurrentMonth: Bool
}

struct CalendarDayCircle: View {
    let date: Date
    let isInCurrentMonth: Bool
    let isSelected: Bool
    let hasEvents: Bool
    let theme: ThemeMode

    private let calendar = Calendar.current

    private var day: Int {
        calendar.component(.day, from: date)
    }

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                if isSelected {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 32, height: 32)
                } else {
                    Circle()
                        .fill(Color.clear)
                        .frame(width: 32, height: 32)
                }

                Text("\(day)")
                    .font(.caption)
                    .foregroundColor(
                        isInCurrentMonth
                        ? (isSelected ? Color.white : Color.primary)
                        : theme.secondaryText.opacity(0.5)
                    )
            }

            if hasEvents {
                Circle()
                    .fill(isSelected ? Color.white : Color.blue)
                    .frame(width: 4, height: 4)
            } else {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 4, height: 4)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// Keep these so HomeTab + Calendar still compile

struct TimetableRow: View {
    let entry: TimetableEntry
    let theme: ThemeMode

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack {
                Text(entry.start)
                    .font(.caption.bold())
                Rectangle()
                    .fill(Color.blue.opacity(0.6))
                    .frame(width: 2, height: 24)
                Text(entry.end)
                    .font(.caption2)
                    .foregroundColor(theme.secondaryText)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(entry.title)
                    .font(.footnote.bold())
                Text(entry.location)
                    .font(.caption)
                    .foregroundColor(theme.secondaryText)
            }
            Spacer()
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: theme == .dark ? 0 : 2)
    }
}




struct EventCardSimple: View {
    let event: CampusEvent
    let theme: ThemeMode

    var body: some View {
        let accent = event.isOfficial ? Color.blue : Color.green

        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 4) {
                Text(event.time)
                    .font(.caption.bold())
                    .foregroundColor(.white)
                Circle()
                    .fill(.white.opacity(0.9))
                    .frame(width: 4, height: 4)
                Spacer()
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .background(accent)
            .clipShape(RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(event.title)
                        .font(.subheadline.bold())
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Spacer()
                    Text(event.isOfficial ? "Official" : "Student")
                        .font(.caption2.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(accent.opacity(0.18))
                        .foregroundColor(accent)
                        .clipShape(Capsule())
                }

                Text(event.location)
                    .font(.caption)
                    .foregroundColor(theme.secondaryText)

                Text(event.description)
                    .font(.caption2)
                    .foregroundColor(theme.secondaryText)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: theme == .dark ? 0 : 3)
    }
}

// MARK: - Explore Tab (Campus circle with map + filters)

struct ExploreTab: View {
    @Binding var theme: ThemeMode

    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 49.1422, longitude: 9.2195),
        span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    )

    @State private var events: [CampusEvent] = DemoData.campusCircleEvents()
    @State private var searchText: String = ""
    @State private var selectedCategory: CampusCategory = .food
    @State private var showCreate = false

    private var filteredEvents: [CampusEvent] {
        events.filter { event in
            let matchesCategory = event.category == selectedCategory

            guard matchesCategory else { return false }

            if searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                return true
            }
            let query = searchText.lowercased()
            return event.title.lowercased().contains(query)
                || event.location.lowercased().contains(query)
                || event.description.lowercased().contains(query)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                // Search bar
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                    TextField("Type in what you're looking for…", text: $searchText)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.black.opacity(theme == .dark ? 0.2 : 0.05))
                )
                .padding(.horizontal)

                // Category icons row
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 14) {
                        ForEach(CampusCategory.allCases) { category in
                            CategoryIconChip(
                                category: category,
                                isSelected: category == selectedCategory
                            )
                            .onTapGesture {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 4)
                }

                // Map with current filtered events + zoom controls
                ZStack(alignment: .bottomTrailing) {
                    Map(coordinateRegion: $region, annotationItems: filteredEvents) { event in
                        MapAnnotation(
                            coordinate: CLLocationCoordinate2D(
                                latitude: event.latitude,
                                longitude: event.longitude
                            )
                        ) {
                            VStack(spacing: 2) {
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 12, height: 12)
                                Text(shortTitle(event.title))
                                    .font(.caption2)
                                    .padding(4)
                                    .background(Color.black.opacity(0.7))
                                    .foregroundColor(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            }
                        }
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 24))

                    VStack(spacing: 8) {
                        Button {
                            zoom(by: 0.7)    // zoom in
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 14, weight: .bold))
                                .padding(8)
                                .background(Color.black.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }

                        Button {
                            zoom(by: 1.3)    // zoom out
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 14, weight: .bold))
                                .padding(8)
                                .background(Color.black.opacity(0.6))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .padding(10)
                }
                .padding(.horizontal)

                // Section title
                HStack {
                    Text(selectedCategory.sectionTitle)
                        .font(.headline)
                    Spacer()
                }
                .padding(.horizontal)

                // List of cards
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filteredEvents) { event in
                            JoinableCampusCircleCard(
                                event: binding(for: event),
                                theme: theme
                            )
                        }

                        if filteredEvents.isEmpty {
                            Text("No items for this filter yet.\nTap the + button to create one.")
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)
                                .multilineTextAlignment(.center)
                                .padding(.top, 16)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
            }
            .background(theme.background.ignoresSafeArea())
            .navigationTitle("Campus circle")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreate = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $showCreate) {
                EventCreateView(
                    theme: theme,
                    region: $region
                ) { newEvent in
                    events.append(newEvent)
                }
            }
        }
    }

    // Helper to get a Binding<CampusEvent> for a given event in filtered list
    private func binding(for event: CampusEvent) -> Binding<CampusEvent> {
        guard let index = events.firstIndex(where: { $0.id == event.id }) else {
            fatalError("Event not found in source array")
        }
        return $events[index]
    }

    private func shortTitle(_ title: String) -> String {
        if title.count <= 14 { return title }
        let idx = title.index(title.startIndex, offsetBy: 12)
        return String(title[title.startIndex..<idx]) + "…"
    }

    private func zoom(by factor: Double) {
        let minDelta = 0.0005
        let maxDelta = 0.02

        var newLat = region.span.latitudeDelta * factor
        var newLon = region.span.longitudeDelta * factor

        newLat = min(max(newLat, minDelta), maxDelta)
        newLon = min(max(newLon, minDelta), maxDelta)

        region.span = MKCoordinateSpan(latitudeDelta: newLat, longitudeDelta: newLon)
    }
}

struct CategoryIconChip: View {
    let category: CampusCategory
    let isSelected: Bool

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .strokeBorder(
                        isSelected ? Color.orange : Color.orange.opacity(0.6),
                        lineWidth: isSelected ? 3 : 1.5
                    )
                    .background(
                        Circle()
                            .fill(isSelected ? Color.orange.opacity(0.2) : Color.clear)
                    )
                    .frame(width: 52, height: 52)

                Image(systemName: category.iconName)
                    .font(.system(size: 20))
                    .foregroundColor(.orange)
            }
            Text(category.rawValue)
                .font(.caption2)
        }
    }
}

// Card with join button and joined count
struct JoinableCampusCircleCard: View {
    @Binding var event: CampusEvent
    let theme: ThemeMode

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        LinearGradient(
                            colors: [Color.orange, Color.pink],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 64, height: 64)
                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(event.title)
                    .font(.subheadline.bold())
                    .lineLimit(2)

                HStack(spacing: 6) {
                    ForEach(event.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption2)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.black.opacity(0.15))
                            .clipShape(Capsule())
                    }
                }

                Text(event.location)
                    .font(.caption)
                    .foregroundColor(theme.secondaryText)

                Text("\(event.joinedCount) joined")
                    .font(.caption2)
                    .foregroundColor(.orange)
            }

            Spacer()

            Button {
                if event.isJoined {
                    event.isJoined = false
                    event.joinedCount = max(0, event.joinedCount - 1)
                } else {
                    event.isJoined = true
                    event.joinedCount += 1
                }
            } label: {
                Text(event.isJoined ? "Joined" : "Join")
                    .font(.caption.bold())
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(event.isJoined ? Color.gray.opacity(0.4) : Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: theme == .dark ? 0 : 3)
    }
}

// Event create sheet used by Campus circle

struct EventCreateView: View {
    let theme: ThemeMode
    @Binding var region: MKCoordinateRegion
    let onCreate: (CampusEvent) -> Void

    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var locationName: String = ""
    @State private var category: CampusCategory = .food
    @State private var priceText: String = ""
    @State private var tagsText: String = ""
    @State private var description: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Basics")) {
                    TextField("Title (e.g. Pizza Night)", text: $title)
                    TextField("Location (room / building / place)", text: $locationName)

                    Picker("Category", selection: $category) {
                        ForEach(CampusCategory.allCases) { cat in
                            Text(cat.rawValue).tag(cat)
                        }
                    }

                    TextField("Price / discount (optional, e.g. €3.20 or -10%)",
                              text: $priceText)
                }

                Section(header: Text("Tags")) {
                    TextField("Comma separated (e.g. Vegan, Mensa)", text: $tagsText)
                }

                Section(header: Text("Description")) {
                    TextField(
                        "What is this? Who is it for? Anything to bring?",
                        text: $description,
                        axis: .vertical
                    )
                    .lineLimit(3...6)
                }

                Section(header: Text("Location on map")) {
                    Text("Move the map. The blue pin is used as event location.")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)

                    Map(coordinateRegion: $region, annotationItems: [region.center]) { center in
                        MapMarker(coordinate: center, tint: .blue)
                    }
                    .frame(height: 220)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }
            .navigationTitle("Create Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") { saveEvent() }
                        .disabled(title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }

    private func saveEvent() {
        let center = region.center
        let cleanTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let cleanLocation = locationName.trimmingCharacters(in: .whitespacesAndNewlines)
        let loc = cleanLocation.isEmpty ? "Custom location" : cleanLocation

        let tags = tagsText
            .split(separator: ",")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        let event = CampusEvent(
            title: cleanTitle,
            date: Date(),
            time: "See details",
            location: loc,
            description: description,
            isOfficial: false,
            latitude: center.latitude,
            longitude: center.longitude,
            joinedCount: 0,
            isJoined: false,
            category: category,
            tags: tags,
            priceText: priceText.isEmpty ? nil : priceText
        )

        onCreate(event)
        dismiss()
    }
}

// MARK: - Stars Tab (leaderboard on top)

struct StarsTab: View {
    @Binding var theme: ThemeMode

    // Top 3 in leaderboard
    @State private var stars: [CampusStar] = [
        CampusStar(name: "Myra",  points: 320, rank: 1, emoji: "👑"),
        CampusStar(name: "Noah",  points: 270, rank: 2, emoji: "🥈"),
        CampusStar(name: "Iva",   points: 230, rank: 3, emoji: "🥉")
    ]

    // Weekly missions checklist
    @State private var missions: [Mission] = [
        Mission(day: "Mon", title: "Invite someone new to sit with you at Mensa.", points: 40, done: false),
        Mission(day: "Tue", title: "Join or host a study group for 1 hour.", points: 35, done: false),
        Mission(day: "Wed", title: "Help a first-semester student find a room or printer.", points: 30, done: false),
        Mission(day: "Thu", title: "Attend a student-run event on campus.", points: 45, done: false),
        Mission(day: "Fri", title: "Introduce two friends who don’t know each other.", points: 25, done: false),
        Mission(day: "Sat", title: "Organise a small walk / coffee meetup.", points: 25, done: false),
        Mission(day: "Sun", title: "Text someone you met this week and check in.", points: 20, done: false)
    ]

    private var weeklyTotal: Int {
        missions.filter { $0.done }.map { $0.points }.reduce(0, +)
    }

    // Reward text – first place only
    private let rewardTitle = "1st place wins this month's reward"
    private let rewardBody = "Free mensa meal."

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 18) {

                    leaderboardSection
                    missionsSection
                    rewardSection

                    Spacer(minLength: 20)
                }
                .padding(.top, 10)
            }
            .background(theme.background.ignoresSafeArea())
            .navigationTitle("Campus Stars")
        }
    }

    // MARK: - Leaderboard at top

    private var leaderboardSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("Leaderboard")
                    .font(.headline)

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Your points: \(weeklyTotal)")
                        .font(.caption.bold())
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color.black.opacity(0.35))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            HStack(spacing: 18) {
                ForEach(stars) { star in
                    VStack(spacing: 6) {
                        ZStack {
                            Circle()
                                .fill(
                                    star.rank == 1
                                    ? Color.orange
                                    : Color.orange.opacity(0.5)
                                )
                                .frame(width: star.rank == 1 ? 70 : 60,
                                       height: star.rank == 1 ? 70 : 60)

                            Text("\(star.rank)")
                                .font(.title3.bold())
                                .foregroundColor(.white)
                        }

                        Text(star.name)
                            .font(.caption)
                        Text("\(star.points) pts")
                            .font(.caption2)
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: theme == .dark ? 0 : 3)
        .padding(.horizontal)
    }

    // MARK: - Missions (checklist)

    private var missionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This week's missions")
                .font(.headline)

            Text("Complete missions, tick them off and earn points.")
                .font(.caption)
                .foregroundColor(theme.secondaryText)

            ForEach(missions.indices, id: \.self) { index in
                MissionRow(mission: $missions[index], theme: theme)
            }
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: theme == .dark ? 0 : 3)
        .padding(.horizontal)
    }

    // MARK: - Reward card

    private var rewardSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("This month's reward")
                .font(.headline)

            Text("Reward for 1st place only")
                .font(.caption.bold())
                .foregroundColor(.orange)

            HStack(spacing: 12) {
                RoundedRectangle(cornerRadius: 18)
                    .fill(
                        LinearGradient(
                            colors: [Color.blue, Color.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 110, height: 80)
                    .overlay(
                        VStack(spacing: 6) {
                            Image(systemName: "gift.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Monthly\nReward")
                                .font(.caption.bold())
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        }
                    )

                VStack(alignment: .leading, spacing: 6) {
                    Text(rewardTitle)
                        .font(.subheadline.bold())
                    Text(rewardBody)
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                        .fixedSize(horizontal: false, vertical: true)

                    Text("Rewards rotate: TUM merch discounts, Mensa coupons, cafeteria coupons and other student discounts.")
                        .font(.caption2)
                        .foregroundColor(theme.secondaryText)
                }

                Spacer()
            }
        }
        .padding()
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: theme == .dark ? 0 : 3)
        .padding(.horizontal)
    }
}

struct MissionRow: View {
    @Binding var mission: Mission
    let theme: ThemeMode

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(spacing: 4) {
                Text(mission.day)
                    .font(.caption2.bold())
                Circle()
                    .fill(mission.done ? Color.green : Color.blue)
                    .frame(width: 6, height: 6)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(mission.title)
                    .font(.footnote)
                    .fixedSize(horizontal: false, vertical: true)
                Text("+\(mission.points) pts")
                    .font(.caption2)
                    .foregroundColor(.orange)
            }

            Spacer()

            Button {
                mission.done.toggle()
            } label: {
                Image(systemName: mission.done ? "checkmark.circle.fill" : "circle")
                    .font(.title3)
                    .foregroundColor(mission.done ? .green : .secondary)
            }
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(theme.cardBackground.opacity(0.95))
        )
    }
}

// MARK: - Campus Connect (Profile Tab)

struct ConnectProfile: Identifiable {
    let id = UUID()
    let name: String
    let major: String
    let interests: [String]
    let distance: String
}

struct ConnectExperience: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let location: String
    let tag: String
    let description: String
    let interests: [String]
}

struct ProfileTab: View {   // Connect tab
    @Binding var theme: ThemeMode

    @State private var selectedInterest: String = "Study"
    private let interestOptions = ["Study", "Sports", "Gaming", "Music", "Events"]

    // many connections (no compatibility text, at least 50 different people)
    private let allConnections: [ConnectProfile] = {
        var list: [ConnectProfile] = []

        func add(_ name: String, _ major: String, _ interests: [String], _ distance: String) {
            list.append(ConnectProfile(name: name, major: major, interests: interests, distance: distance))
        }

        add("Sara A.",  "BIE",                ["Study", "Music"],             "120 m · HN-G")
        add("Leon M.",  "MIM",                ["Events", "Study"],            "Library · 2nd floor")
        add("Fatima K.","BMDS",               ["Sports", "Study"],            "Sports hall")
        add("Jonas R.", "Informatics",        ["Gaming", "Events"],           "Dorms · 5 min walk")
        add("Mina S.",  "BIE",                ["Music", "Events"],            "HN-G · Ground floor")
        add("Omar T.",  "BMDS",               ["Sports", "Gaming"],           "Gym entrance")
        add("Lena P.",  "Management & Tech",  ["Study", "Events"],            "Library · Silent area")
        add("Yuki H.",  "Informatics",        ["Gaming", "Study"],            "Mensa upstairs")
        add("David G.", "BWL",                ["Events", "Sports"],           "Campus lounge")
        add("Nadia L.", "BIE",                ["Music", "Study"],             "HN-G · 3rd floor")
        add("Samir Z.", "Informatics",        ["Gaming"],                     "E-sports room")
        add("Julia W.", "Psychology",         ["Events", "Music"],            "Auditorium")
        add("Bilal K.", "BMDS",               ["Sports", "Study", "Events"],  "Outdoor court")
        add("Aisha H.", "Robotics",           ["Study", "Events"],            "Lab building")
        add("Marco V.", "Mathematics",        ["Study"],                      "Library · Basement")
        add("Ella S.",  "Architecture",       ["Music", "Events"],            "Design studio")
        add("Hassan L.","Informatics",        ["Gaming", "Study"],            "Dorms · 2 min")
        add("Nico R.",  "BIE",                ["Sports"],                     "Sports field")
        add("Laila J.", "MIM",                ["Events", "Music"],            "Campus lounge")
        add("Oksana P.","Informatics",        ["Study", "Gaming"],            "HN-G · 4th floor")
        add("Ravi K.",  "BIE",                ["Study", "Sports"],            "Library · Group room")
        add("Yara M.",  "BMDS",               ["Study"],                      "HN-G · Ground floor")
        add("Timo F.",  "Informatics",        ["Gaming", "Events"],           "Dorms · 7 min")
        add("Ana L.",   "Psychology",         ["Music"],                      "Café Einstein")
        add("Sven P.",  "BWL",                ["Events"],                     "Campus bar")
        add("Khalid A.","Information Eng.",   ["Study", "Gaming"],            "HN-G · 1st floor")
        add("Marta R.", "BIE",                ["Study", "Music"],             "Library · 1st floor")
        add("Yasmin S.","Informatics",        ["Gaming", "Sports"],           "E-sports room")
        add("Adam Q.",  "Mathematics",        ["Study", "Events"],            "Math lounge")
        add("Noor D.",  "Architecture",       ["Music", "Study"],             "Studio · 2nd floor")
        add("Paula T.", "MIM",                ["Events", "Study"],            "Campus café")
        add("Ziad N.",  "BMDS",               ["Sports"],                     "Sports hall")
        add("Helena C.","Informatics",        ["Gaming"],                     "Dorm common room")
        add("Omar Y.",  "BIE",                ["Study"],                      "Library · balcony")
        add("Sofia G.", "Psychology",         ["Music", "Events"],            "Campus stage")
        add("Imran P.", "Informatics",        ["Gaming", "Study"],            "Computer lab")
        add("Mina Y.",  "Information Eng.",   ["Study", "Events"],            "HN-G · 2nd floor")
        add("Lucas D.", "BWL",                ["Events", "Sports"],           "Campus bar")
        add("Reem H.",  "BMDS",               ["Study", "Music"],             "HN-G · 3rd floor")
        add("Tara F.",  "Architecture",       ["Events"],                     "Exhibition hall")
        add("Phil K.",  "Mathematics",        ["Study"],                      "Math library")
        add("Nada S.",  "BIE",                ["Sports", "Events"],           "Outdoor court")
        add("Jonah B.", "Informatics",        ["Gaming"],                     "E-sports room")
        add("Aya L.",   "Psychology",         ["Music", "Study"],             "Café corner")
        add("Hadi R.",  "Information Eng.",   ["Study", "Gaming"],            "HN-G · 4th floor")
        add("Mila C.",  "MIM",                ["Events"],                     "Campus lounge")
        add("Zoe N.",   "Mathematics",        ["Study", "Events"],            "Library · 2nd floor")
        add("Karim T.", "Informatics",        ["Gaming", "Sports"],           "Sports hall")
        add("Salma J.", "BIE",                ["Study", "Music"],             "Library · quiet zone")

        return list
    }()

    private let experiences: [ConnectExperience] = [
        ConnectExperience(
            title: "Algorithms Study Jam",
            time: "Today · 18:00",
            location: "HN-G Learning Area",
            tag: "Study · BIE / BMDS",
            description: "Small group solving old exam questions together.",
            interests: ["Study"]
        ),
        ConnectExperience(
            title: "AI & Ethics Workshop",
            time: "Thu · 17:00",
            location: "Room HN-G C.1.10",
            tag: "Workshop",
            description: "Hands-on session about AI use at university and in exams.",
            interests: ["Study", "Events"]
        ),
        ConnectExperience(
            title: "Evening Volleyball Meetup",
            time: "Fri · 20:00",
            location: "Campus sports hall",
            tag: "Sports · Social",
            description: "Casual games, all skill levels welcome, just bring sports shoes.",
            interests: ["Sports", "Events"]
        ),
        ConnectExperience(
            title: "LAN Party Night",
            time: "Sat · 19:00",
            location: "HN-G project room",
            tag: "Gaming",
            description: "Bring your laptop or console and play co-op games all night.",
            interests: ["Gaming", "Events"]
        ),
        ConnectExperience(
            title: "Open Mic & Music Jam",
            time: "Wed · 19:30",
            location: "Campus lounge",
            tag: "Music · Social",
            description: "Sing, play an instrument or just listen and meet other music lovers.",
            interests: ["Music", "Events"]
        )
    ]

    @State private var pendingRequests: Set<UUID> = []   // ids of profiles you tapped "Buddy up"

    private var filteredConnections: [ConnectProfile] {
        allConnections.filter { match in
            match.interests.contains(selectedInterest)
        }
    }

    private var filteredExperiences: [ConnectExperience] {
        experiences.filter { exp in
            exp.interests.contains(selectedInterest)
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Campus Connect")
                            .font(.largeTitle.bold())
                        Text("Find students with similar interests – and discover events that match you.")
                            .font(.footnote)
                            .foregroundColor(theme.secondaryText)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 14) {
                        Text("Tell us about you")
                            .font(.headline)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Interests")
                                .font(.caption)
                                .foregroundColor(theme.secondaryText)

                            Menu {
                                ForEach(interestOptions, id: \.self) { option in
                                    Button(option) { selectedInterest = option }
                                }
                            } label: {
                                HStack {
                                    Text(selectedInterest)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                }
                                .padding()
                                .background(theme.cardBackground.opacity(0.9))
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                            }
                        }

                        Button {
                            // later: refresh from backend
                        } label: {
                            Text("Find my people")
                                .font(.headline)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    LinearGradient(
                                        colors: [.orange, .pink],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .foregroundColor(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        }
                    }
                    .padding()
                    .background(theme.cardBackground)
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                    .shadow(radius: theme == .dark ? 0 : 3)
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Your connections")
                                .font(.headline)
                            Spacer()
                            Text("Matches")
                                .font(.caption)
                                .foregroundColor(.orange)
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 14) {
                                ForEach(filteredConnections) { match in
                                    ConnectProfileCard(
                                        profile: match,
                                        theme: theme,
                                        isPending: pendingRequests.contains(match.id),
                                        onBuddyUp: {
                                            if pendingRequests.contains(match.id) {
                                                pendingRequests.remove(match.id)
                                            } else {
                                                pendingRequests.insert(match.id)
                                            }
                                        }
                                    )
                                }
                            }
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Recommended experiences")
                            .font(.headline)

                        ForEach(filteredExperiences) { exp in
                            ExperienceCard(exp: exp, theme: theme)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
                .padding(.top, 16)
            }
            .background(theme.background.ignoresSafeArea())
            .navigationTitle("")
        }
    }
}

struct ConnectProfileCard: View {
    let profile: ConnectProfile
    let theme: ThemeMode
    let isPending: Bool
    let onBuddyUp: () -> Void

    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 56, height: 56)
                Text(String(profile.name.first ?? "S"))
                    .font(.title2.bold())
            }

            Text(profile.name)
                .font(.subheadline.bold())

            Text(profile.major)
                .font(.caption)
                .foregroundColor(theme.secondaryText)

            Text(profile.distance)
                .font(.caption2)
                .foregroundColor(theme.secondaryText)

            HStack(spacing: 6) {
                ForEach(profile.interests.prefix(2), id: \.self) { tag in
                    Text(tag)
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.blue.opacity(0.12))
                        .clipShape(Capsule())
                }
            }

            Button {
                onBuddyUp()
            } label: {
                Text(isPending ? "Cancel request" : "Buddy up")
                    .font(.caption.bold())
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 6)
                    .background(isPending ? Color.gray.opacity(0.4) : Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding(12)
        .frame(width: 190)
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: theme == .dark ? 0 : 3)
    }
}

struct ExperienceCard: View {
    let exp: ConnectExperience
    let theme: ThemeMode

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 16)
                .fill(LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 54, height: 54)
                .overlay(
                    Image(systemName: "sparkles")
                        .foregroundColor(.white)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(exp.title)
                    .font(.subheadline.bold())
                Text("\(exp.time) · \(exp.location)")
                    .font(.caption)
                    .foregroundColor(theme.secondaryText)

                Text(exp.description)
                    .font(.caption2)
                    .foregroundColor(theme.secondaryText)
                    .lineLimit(2)

                Text(exp.tag)
                    .font(.caption2)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 3)
                    .background(Color.green.opacity(0.18))
                    .clipShape(Capsule())
            }

            Spacer()
        }
        .padding(10)
        .background(theme.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: theme == .dark ? 0 : 3)
    }
}

// MARK: - Settings

struct SettingsView: View {
    @Binding var theme: ThemeMode

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Picker("Theme", selection: $theme) {
                    ForEach(ThemeMode.allCases) { mode in
                        Text(mode.label).tag(mode)
                    }
                }
            }

            Section(header: Text("About")) {
                Text("Concept:CampusLife is a modern companion app designed to make student life easier, more connected, and more organizedIt brings together everything you need on campus — all in one place..")
                    
                    .font(.caption)
            }
        }
        .navigationTitle("Settings")
    }
}

// MARK: - Profile Detail View (Student card)

struct ProfileDetailView: View {
    let theme: ThemeMode
    let profile: UserProfile

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Digital Student Card
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .center, spacing: 8) {
                        Image(systemName: "graduationcap.fill")
                            .foregroundColor(.blue)
                        Text("TUM")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }

                    Text("Digital StudentCard")
                        .font(.title3.bold())

                    HStack(alignment: .top, spacing: 16) {
                        // Photo
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 90, height: 120)

                            Text(initials(from: profile.name))
                                .font(.largeTitle.bold())
                                .foregroundColor(.white)
                        }

                        VStack(alignment: .leading, spacing: 6) {
                            Text(profile.name)
                                .font(.headline)

                            Group {
                                HStack {
                                    Text("Study ID:")
                                        .font(.caption.bold())
                                    Text(profile.matriculationNumber)
                                        .font(.caption)
                                }

                                HStack(alignment: .top) {
                                    Text("Program:")
                                        .font(.caption.bold())
                                    Text(profile.program)
                                        .font(.caption)
                                }

                                HStack(alignment: .top) {
                                    Text("Campus:")
                                        .font(.caption.bold())
                                    Text(profile.campus)
                                        .font(.caption)
                                }

                                HStack(alignment: .top) {
                                    Text("E-mail:")
                                        .font(.caption.bold())
                                    Text(profile.email)
                                        .font(.caption)
                                }
                            }
                        }
                        Spacer()
                    }

                    HStack {
                        Text("Valid until: 31.03.2026")
                            .font(.footnote.bold())
                        Spacer()
                        Text("VALID")
                            .font(.footnote.bold())
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue.opacity(0.2))
                            )
                    }
                    .padding(.top, 8)
                }
                .padding()
                .background(theme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .shadow(radius: theme == .dark ? 0 : 4)
                .padding(.horizontal)

                // Library barcode section (simple placeholder)
                VStack(alignment: .leading, spacing: 12) {
                    Text("Library Barcode")
                        .font(.subheadline.bold())

                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                        .frame(height: 70)
                        .overlay(
                            HStack(spacing: 2) {
                                ForEach(0..<40) { _ in
                                    RoundedRectangle(cornerRadius: 1)
                                        .fill(Color.black)
                                        .frame(width: .random(in: 1...3), height: 54)
                                }
                            }
                            .padding(.horizontal, 8)
                        )

                    Text("Library Number: 04201509299")
                        .font(.caption)
                        .foregroundColor(theme.secondaryText)
                }
                .padding()
                .background(theme.cardBackground)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .shadow(radius: theme == .dark ? 0 : 4)
                .padding(.horizontal)

                Spacer(minLength: 20)
            }
            .padding(.top, 16)
        }
        .background(theme.background.ignoresSafeArea())
        .navigationTitle("Student Card")
    }
}

// MARK: - Friends / Chat

struct FriendsView: View {
    let theme: ThemeMode

    @State private var friends: [Friend] = DemoData.friends
    @State private var requests: [FriendRequest] = DemoData.friendRequests
    @State private var showRequests: Bool = false

    var body: some View {
        List {
            ForEach(friends) { friend in
                NavigationLink(destination: ChatView(friend: friend, theme: theme)) {
                    FriendRow(friend: friend)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Friends")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    showRequests = true
                } label: {
                    ZStack(alignment: .topTrailing) {
                        Image(systemName: "person.badge.plus")
                            .font(.system(size: 18, weight: .semibold))

                        if !requests.isEmpty {
                            Text("\(requests.count)")
                                .font(.system(size: 9, weight: .bold))
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color.red)
                                .clipShape(Circle())
                                .offset(x: 8, y: -6)
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showRequests) {
            NavigationStack {
                FriendRequestsView(
                    theme: theme,
                    requests: $requests,
                    onAccept: { request in
                        friends.append(
                            Friend(
                                name: request.name,
                                major: request.major,
                                location: request.details,
                                lastSeen: "Online"
                            )
                        )
                    }
                )
            }
        }
    }
}

struct FriendRow: View {
    let friend: Friend

    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(Color.blue.opacity(0.25))
                .frame(width: 42, height: 42)
                .overlay(
                    Text(String(friend.name.first ?? "F"))
                        .font(.headline.bold())
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(friend.name)
                    .font(.subheadline.bold())
                Text(friend.major)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(friend.location)
                    .font(.caption2)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "bubble.right.fill")
                .foregroundColor(.blue)
        }
        .padding(.vertical, 4)
    }
}

struct FriendRequestsView: View {
    let theme: ThemeMode
    @Binding var requests: [FriendRequest]

    let onAccept: (FriendRequest) -> Void

    var body: some View {
        List {
            if requests.isEmpty {
                Text("No new friend requests.")
                    .font(.caption)
                    .foregroundColor(.secondary)
            } else {
                ForEach(requests) { req in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(req.name)
                                .font(.subheadline.bold())
                            Spacer()
                            Text(req.major)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Text(req.details)
                            .font(.caption2)
                            .foregroundColor(.secondary)

                        HStack(spacing: 12) {
                            Button {
                                onAccept(req)
                                requests.removeAll { $0.id == req.id }
                            } label: {
                                Text("Accept")
                                    .font(.caption.bold())
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .clipShape(Capsule())
                            }

                            Button {
                                requests.removeAll { $0.id == req.id }
                            } label: {
                                Text("Decline")
                                    .font(.caption.bold())
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.primary)
                                    .clipShape(Capsule())
                            }
                        }
                        .padding(.top, 4)
                    }
                    .padding(.vertical, 6)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Requests")
    }
}

struct ChatView: View {
    let friend: Friend
    let theme: ThemeMode

    @State private var messages: [String]
    @State private var newMessage: String = ""

    init(friend: Friend, theme: ThemeMode) {
        self.friend = friend
        self.theme = theme

        let firstName = friend.name.split(separator: " ").first.map(String.init) ?? friend.name
        _messages = State(initialValue: [
            "Hey \(firstName), want to study together later?",
            "Sure! I’m free after 5."
        ])
    }

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(messages.indices, id: \.self) { index in
                            HStack {
                                if index % 2 == 0 {
                                    bubble(messages[index], isMe: true)
                                    Spacer()
                                } else {
                                    Spacer()
                                    bubble(messages[index], isMe: false)
                                }
                            }
                            .id(index)
                        }
                    }
                    .padding()
                    .onChange(of: messages.count) { _ in
                        if let last = messages.indices.last {
                            DispatchQueue.main.async {
                                proxy.scrollTo(last, anchor: .bottom)
                            }
                        }
                    }
                }
            }

            HStack {
                TextField("Message \(friend.name)…", text: $newMessage)
                    .textFieldStyle(.roundedBorder)
                Button {
                    let text = newMessage.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !text.isEmpty else { return }
                    messages.append(text)
                    newMessage = ""
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
        .background(theme.background.ignoresSafeArea())
        .navigationTitle(friend.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    private func bubble(_ text: String, isMe: Bool) -> some View {
        Text(text)
            .padding(10)
            .background(isMe ? Color.blue : Color.gray.opacity(0.2))
            .foregroundColor(isMe ? .white : .primary)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(maxWidth: UIScreen.main.bounds.width * 0.7, alignment: isMe ? .leading : .trailing)
    }
}

// MARK: - Auth View (Login / Sign up)

struct AuthView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil

    let onLogin: () -> Void

    // Demo credentials
    private let validEmail = "eyas60@wed.mytum.de"
    private let validPassword = "eyas123"

    var body: some View {
        NavigationStack {
            ZStack {
                Image("loginBG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                Color.black.opacity(0.35)
                    .ignoresSafeArea()

                VStack(spacing: 28) {
                    Spacer(minLength: 40)

                    VStack(spacing: 8) {
                        Text("CampusLife")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)

                        Text("Sign in to your TUM campus app")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 24)
                    }

                    // input fields
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Username")
                                .font(.subheadline.bold())
                                .foregroundColor(.white)

                            ZStack(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black.opacity(0.45))

                                HStack {
                                    TextField("", text: $email)
                                        .keyboardType(.emailAddress)
                                        .textInputAutocapitalization(.none)
                                        .autocorrectionDisabled()
                                        .foregroundColor(.white)
                                        .placeholder(when: email.isEmpty) {
                                            Text("e.g. eyas60@wed.mytum.de")
                                                .foregroundColor(.white.opacity(0.65))
                                        }
                                        .padding(.horizontal, 10)
                                }
                                .padding(.vertical, 10)
                            }
                            .frame(height: 48)
                        }

                        VStack(alignment: .leading, spacing: 6) {
                            Text("Password")
                                .font(.subheadline.bold())
                                .foregroundColor(.white)

                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.black.opacity(0.45))

                                SecureField("", text: $password)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                            }
                            .frame(height: 48)
                        }

                        if let errorMessage {
                            Text(errorMessage)
                                .font(.caption)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .padding(.horizontal)

                    Button {
                        handleLogin()
                    } label: {
                        Text("Sign in")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background((email.isEmpty || password.isEmpty) ? Color.white.opacity(0.3) : Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(18)
                    }
                    .padding(.horizontal)
                    .disabled(email.isEmpty || password.isEmpty)

                    Button {
                        // Hint for demo accounts
                        email = validEmail
                        password = validPassword
                        errorMessage = "Demo login: credentials filled. Tap Sign in."
                    } label: {
                        Text("Create new account (demo)")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.95))
                            .underline()
                    }

                    Spacer(minLength: 40)
                }
            }
        }
    }

    private func handleLogin() {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)

        if trimmedEmail == validEmail && password == validPassword {
            errorMessage = nil
            onLogin()
        } else {
            errorMessage = "Wrong username or password."
        }
    }
}

// MARK: - TextField placeholder helper

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder content: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            content().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

