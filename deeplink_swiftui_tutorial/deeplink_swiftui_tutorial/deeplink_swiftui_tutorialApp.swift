//
//  deeplink_swiftui_tutorialApp.swift
//  deeplink_swiftui_tutorial
//
//  Created by hyorin song on 2021/11/20.
//

import SwiftUI

@main
struct deeplink_swiftui_tutorialApp: App {
    @State var selectedTab = TabIdentifier.todos
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab, content: {
                TodosView().tabItem{
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("할일목록")
                    }
                }.tag(TabIdentifier.todos)
                ProfileView().tabItem{
                    VStack{
                        Image(systemName: "person.circle.fill")
                        Text("프로필")
                    }
                }.tag(TabIdentifier.profile)
            })
                .onOpenURL(perform: { url in
                    guard let tabId = url.tabIndetifier else {return}
                    selectedTab = tabId
                })
        }
    }
}

struct  deeplink_swiftui_tutorialApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World")
    }
}

//어떤 탭이 선택되었는지
enum TabIdentifier : Hashable{
//cas todos, profile
    case todos
    case profile
}

//어떤 페이지를 보여줘야 하는지
enum PageIdenfitier : Hashable{
    case todoItem(id: UUID)
    
}

extension URL{
    //info 에서 추가한 딥링크가 들어왔는지 여부
    var isDeeplink : Bool{
        return scheme == "deeplink-swiftui"
    }
    //url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIndetifier : TabIdentifier? {
        guard isDeeplink else { return nil}

        switch host{
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:return nil
            
        }
    }
    
    var detailPage: PageIdenfitier? {
        
        //deeplink-swiftui://hohoho/great
        
        print("pathComponents: \(pathComponents)")
        
        guard let tabId = tabIndetifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else {return nil}
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
    
}
