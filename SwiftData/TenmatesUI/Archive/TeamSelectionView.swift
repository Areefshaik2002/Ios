////
////  TeamSelectionView.swift
////  Tenmates
////
////  Created by sujith varma on 1/7/25.
////
//
//import SwiftUI
//
//@available(iOS 17.0, *)
//struct TeamSelectionView: View {
//    @State var viewModel: TeamSelectionViewModel
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        CustomLoadingView(isShowing: $viewModel.showLoader,
//                          loadingMessage: $viewModel.loadingMessage) {
//            mainContent
//                .toolbar(.hidden, for: .tabBar)
//                .navigationBarTitle(APIResourceString.shared.createEventMainText, displayMode: .inline)
//                .navigationBarBackButtonHidden(true)
//                .navigationBarItems(leading: backButton, trailing: closeButton)
//                .onAppear(perform: loadTeams)
//                .ignoresSafeArea(.all, edges: .bottom)
//                .alert(isPresented: $viewModel.showAlert) { createAlert() }
//                .topProgressIndicatorWithSteps(currentStep: CreateEventManager.shared.currentStep,
//                                               totalSteps: CreateEventManager.shared.totalNumberOfSteps)
//        }
//    }
//    
//    var mainContent: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            
//            headerSection
//            
//            Spacer().frame(height: SpacingConstants.space24)
//            
//            searchBar
//            
//            Spacer().frame(height: SpacingConstants.space16)
//            
//            if viewModel.screenMode == .userTeam {
//                addTeamButton
//            }
//            
//            Spacer().frame(height: SpacingConstants.space8)
//            
//            if viewModel.showShimmer {
//                ShimmerView(name: ShimmerStr.createEventTeamList.rawValue).shimmering()
//            } else if viewModel.teams?.isEmpty == true {
//                noTeamsView
//                    .padding(.horizontal, SpacingConstants.space16)
//            } else {
//                teamsListView
//            }
//            
//            Spacer()
//            
//            Divider()
//            
//            Spacer().frame(height: SpacingConstants.space16)
//            
//            continueButton
//            
//            Spacer().frame(height: SpacingConstants.space32)
//            
//            navigationLinkToEventType
//            navigationLinkToCourtsCount
//            navigationLinkToCourtsDetails
//            navigateToDefineHomeAwayTeamView
//            navigateToNewTeamCreationView
//        }
//    }
//    
//    var headerSection: some View {
//        TopSectionInCreateEventView(
//            title: viewModel.topSectionTitle,
//            description: viewModel.topSectionDescription,
//            courtsCount: nil
//        )
//        .padding(.top, SpacingConstants.space20)
//        .padding(.horizontal, SpacingConstants.space16)
//    }
//    
//    var addTeamButton: some View {
//        HStack {
//            Image("new_plus_icon")
//                .resizable()
//                .scaledToFit()
//                .frame(width: SpacingConstants.space24, height: SpacingConstants.space24)
//                .accessibilityIdentifier("add_team_button_image")
//            Text(APIResourceString.shared.createEventMessagesDict?.teams?.teamSelectTeamCreateText ?? "")
//                .foregroundColor(.normalText)
//                .font(.appTitle3)
//                .accessibilityIdentifier("add_team_button_text")
//            Spacer()
//        }
//        .applyBackgroundAndPadding(true,
//                                   cornerRadius: SpacingConstants.space8,
//                                   padding: SpacingConstants.space12)
//        .background(
//            latestGranularGradient()
//        )
//        .padding(.horizontal, SpacingConstants.space16)
//        .onTapGesture {            
//            viewModel.navigateToNewTeamCreationView = true
//        }
//    }
//    
//    var teamsListView: some View {
//        ScrollView {
//            VStack(spacing: SpacingConstants.space16) {
//                ForEach(enumerating: viewModel.teams ?? []) { index, team in
//                    teamRow(for: team)
//                }
//            }
//            .padding(.top, SpacingConstants.space8)
//            .padding(.horizontal, SpacingConstants.space16)
//        }
//    }
//    
//    func teamRow(for team: Team?) -> some View {
//        
//        let selectedTeam = (viewModel.screenMode == .userTeam) ? viewModel.selectedUserTeam : viewModel.selectedOpponentTeam
//        let isTeamSelected = selectedTeam?.id == team?.id
//        
//        return VStack(alignment: .leading, spacing: 0) {
//            Text(team?.name ?? "")
//                .foregroundColor(.normalText)
//                .font(.appTitle3)
//                .lineLimit(1)
//                .accessibilityIdentifier("team_name")
//            
//            
//            Spacer().frame(height: team?.leagueName == nil ? SpacingConstants.space16 : SpacingConstants.space4)
//            
//            HStack {
//                playersAvatarView(team: team)
//                
//                Text(viewModel.playersCountText(team))
//                    .foregroundColor(.normalText)
//                    .font(.appFootnoteRegular2)
//                    .accessibilityIdentifier("players_count_text")
//                Spacer()
//                if let leagueName = team?.leagueName {
//                    Text(leagueName)
//                        .foregroundColor(.normalText)
//                        .font(.appFootnoteRegular2)
//                        .frame(height: SpacingConstants.space24)
//                        .padding(.vertical, SpacingConstants.space6)
//                        .padding(.horizontal, SpacingConstants.space8)
//                        .background(RoundedRectangle(cornerRadius: SpacingConstants.space28).fill(Color.primaryColor.opacity(0.4)))
//                        .accessibilityIdentifier("league_name")
//                }
//            }
//        }
//        .applyBackgroundAndPadding(true,
//                                   cornerRadius: SpacingConstants.space8,
//                                   isSelected: isTeamSelected)
//        .background(
//            RoundedRectangle(cornerRadius: 8)
//                .latestGranularGradient(isLinear: true)
//        )
//        .onTapGesture {
//            if viewModel.screenMode == .userTeam {
//                viewModel.selectedUserTeam = team
//            } else {
//                viewModel.selectedOpponentTeam = team
//            }
//        }
//    }
//    
//    func playersAvatarView(team: Team?) -> some View {
//        HStack(spacing: -6) {
//            ForEach((team?.users?.prefix(3) ?? []), id: \.id) { user in
//                
//                TenmatesImageView(user: user, size: SpacingConstants.space28)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.newRowBg, lineWidth: 1))
//                    .accessibilityIdentifier("players_avatar_image")
//            }
//        }
//        
//    }
//    
//    var searchBar: some View {
//        HStack {
//            Image("search_icon")
//                .resizable()
//                .frame(width: SpacingConstants.space16, height: SpacingConstants.space16)
//                .accessibilityIdentifier(AccessibilityIdentifiers.SelectOpponentTeam.searchIcon)
//            TextField(APIResourceString.shared.createEventMessagesDict?.teams?.teamSelectTeamSearchText ?? "", text: $viewModel.teamsSearch)
//            
//                .font(.appFootnoteRegular)
//                .onChange(of: viewModel.teamsSearch, debounceTime: IntegerConstant.debounceTimeDelay) { _ in
//                    handleSearchInput()
//                }
//                .accessibilityIdentifier(AccessibilityIdentifiers.SelectOpponentTeam.searchBar)
//            if viewModel.showSmallLoader {
//                AnimatingDotView(height: SpacingConstants.space6, spacing: 0)
//            } else if viewModel.teamsSearch?.count ?? 0 > 0 {
//                Button(action: { viewModel.teamsSearch = "" }) {
//                    Image(systemName: "xmark.circle")
//                        .foregroundColor(.hintColor)
//                }
//                .accessibilityIdentifier(AccessibilityIdentifiers.SelectOpponentTeam.crossMark)
//            }
//        }
//        .padding(SpacingConstants.space16)
//        .background(RoundedRectangle(cornerRadius: SpacingConstants.space12).fill(Color.clear))
//        .overlay(RoundedRectangle(cornerRadius: SpacingConstants.space12).stroke(Color.createEventBorder, lineWidth: 1))
//        .padding(.horizontal, SpacingConstants.space16)
//    }
//    
//    var noTeamsView: some View {
//        VStack(spacing: SpacingConstants.space8) {
//            Spacer()
//            
//            Image("team_based_icon")
//                .resizable()
//                .scaledToFit()
//                .frame(width: SpacingConstants.space64, height: SpacingConstants.space64)
//            
//            Text("No teams")
//                .foregroundColor(.normalText)
//                .font(.appTitle3)
//            
//            if viewModel.teamsSearch == nil {
//                Text("There are no registered teams yet, create a new one now!")
//                    .foregroundColor(.hintTextClr)
//                    .font(.appTitle6)
//                    .multilineTextAlignment(.center)
//            }
//            
//            Spacer()
//        }
//        .frame(maxWidth: .infinity)
//        .padding(.horizontal, SpacingConstants.space16)
//    }
//    
//    
//    var continueButton: some View {
//        
//        ContinueButtonView(isButtonEnabled: viewModel.isContinueButtonEnabled,
//                           buttonText: StringConstants.continueText) { _ in
//            
//            if viewModel.screenMode == .opponentTeam {
//                
//                viewModel.handleApiActions { isSuccess in
//                    if isSuccess {
//                        handleNextScreenNavigation()
//                    }
//                }
//            } else {
//                handleNextScreenNavigation()
//            }
//        }.padding(.horizontal, SpacingConstants.space16)
//    }
//    
//    var backButton: some View {
//        Button(action: {
//            handleBackButtonTap()
//        }) {
//            BackArrow()
//        }
//    }
//    
//    func handleBackButtonTap() {
//        CreateEventManager.shared.decrementStep()
//        dismiss()
//    }
//    
//    var forwardButton: some View {
//        Button(action: {
//            handleNextScreenNavigation()
//        }) {
//            RightArrow()
//                .accessibilityIdentifier(AccessibilityIdentifiers.LeaguesCreatePair.forwardButton)
//        }
//    }
//    
//    var closeButton: some View {
//        Button(action: handleBackButtonTap, label: {
//            CloseButton()
//        })
//    }
//    
//    func loadTeams() {
//        viewModel.getTeams()
//        viewModel.setIntialData()
//    }
//    
//    func handleNextScreenNavigation() {
//        
//        CreateEventManager.shared.incrementStep()
//        
//        AnalyticsManager.shared.triggerEvent(eventName: AnalyticsConstants.AddEventScreen.addEventForwardArrowClicked)
//        
//        if viewModel.screenMode == .userTeam {
//            viewModel.navigateToEventType = true
//        } else if viewModel.screenMode == .opponentTeam {
//            
//            /*
//             // Old Code
//             if viewModel.event?.isCompetitiveOrCasualEvent == true || viewModel.event?.isPracticeDrillEvent == true || viewModel.event?.isGroupLessonEvent == true {
//             viewModel.navigateToCourtsCount = true
//             } else if viewModel.event?.isBallMachineEvent == true || viewModel.event?.isIndividualLessonEvent == true {
//             viewModel.navigateToCourtDetails = true
//             }
//             */
//            
//            // Navigate to HomeAwayTeam Selection Screen
//            viewModel.navigateToDefineHomeAwayTeamView = true
//        }
//    }
//    
//    func handleSearchInput() {
//        if let searchText = viewModel.teamsSearch?.trimmingCharacters(in: .whitespaces), searchText.count > 1 {
//            viewModel.getTeams(search: searchText)
//        } else if viewModel.teamsSearch?.isEmpty == true {
//            viewModel.getTeams()
//        }
//    }
//    
//    func createAlert() -> Alert {
//        Alert(
//            title: Text(""),
//            message: Text(viewModel.alertMessage),
//            dismissButton: .default(Text(StringConstants.addOk)) {
//                viewModel.showAlert = false
//            }
//        )
//    }
//    
//    var navigationLinkToEventType: some View {
//        let eventTypeModel = EventTypeModel(eventFlowType: .team,
//                                            selectedUserTeam: viewModel.selectedUserTeam)
//        let eventTypeViewModel = EventTypeViewModel(model: eventTypeModel)
//        return NavigationLink(
//            destination: EventTypeView(viewModel: eventTypeViewModel),
//            isActive: $viewModel.navigateToEventType
//        ) {
//            EmptyView()
//        }
//    }
//    var navigationLinkToCourtsCount: some View {
//        let courtsCountViewModel = CourtsCountViewModel(model: CourtsCountModel(event: viewModel.event))
//        return NavigationLink(
//            destination: CourtsCountView(viewModel: courtsCountViewModel),
//            isActive: $viewModel.navigateToCourtsCount
//        ) {
//            EmptyView()
//        }
//    }
//    var navigationLinkToCourtsDetails: some View {
//        let courtDetailsModel = CourtDetailsModel(event: viewModel.event)
//        let courtDetailsViewModel = CourtDetailsViewModel(model: courtDetailsModel )
//        return NavigationLink(
//            destination: CourtDetailsView(viewModel: courtDetailsViewModel),
//            isActive: $viewModel.navigateToCourtDetails
//        ) {
//            EmptyView()
//        }
//    }
//    
//    var navigateToDefineHomeAwayTeamView: some View {
//        let defineHomeAwayTeamViewModel = DefineHomeAwayTeamViewModel(model: DefineHomeAwayTeamModel(event: viewModel.event))
//        return NavigationLink(
//            destination: DefineHomeAwayTeamView(viewModel: defineHomeAwayTeamViewModel),
//            isActive: $viewModel.navigateToDefineHomeAwayTeamView
//        ) {
//            EmptyView()
//        }
//    }
//    
//    var navigateToNewTeamCreationView: some View {
//        let addTeamModel = AddTeamModel()
//        let addTeamViewModel = AddTeamViewModel(model: addTeamModel)
//        
//        var addTeamView = AddTeamView(viewModel: addTeamViewModel)
//        addTeamView.didCreateTeam = didCreateTeam
//        
//        return (
//            NavigationLink(destination:addTeamView ,
//                           isActive: $viewModel.navigateToNewTeamCreationView) {
//                               EmptyView()
//                           }
//        )
//        
//    }
//    
//    func didCreateTeam(team: Team) -> Void {
//        viewModel.selectedUserTeam = team
//        viewModel.navigateToNewTeamCreationView = false
//    }
//    
//}
