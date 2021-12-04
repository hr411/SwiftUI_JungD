//
//  ContentView.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import SwiftUI

class RefreshControlHelper {
    
    //MARK: Properties
    var parentContentView : ContentView?
    var refreshControl : UIRefreshControl?
    
    @objc func didRefresh(){
        print(#fileID, #function, #line, "")
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            print("parentContentView, refreshControl 가 nil 입니다")
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            print("리프레시가 되었다")
            //MARK: - TODO : Api 다시 땡기기
//            parentContentView.randomUserViewModel.fetchRandomUsers()
            parentContentView.randomUserViewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        })
    }
    
}

struct MyBottomProgressView: View{

    var body: some View{
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: Color.orange))
            .scaleEffect(1.7,anchor: .center)
    }
}

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) {
            aRandomUser in
                RandomUserRowView(aRandomUser)
                .onAppear{
                    fetchMoreData(aRandomUser)
                }
        }
       
        //데이터 로딩 중이라면
        if randomUserViewModel.isLoading {
            MyBottomProgressView()
        }
    }
}
//MARK: - Helper Methods
extension ContentView {
    
    fileprivate func fetchMoreData(_ randomUser: RandomUser){
        print(#fileID, #function, #line, "")
        if self.randomUserViewModel.randomUsers.last == randomUser{
            print("[마지막]에 도달했다")
            randomUserViewModel.fetchMoreActionSubject.send()
        }
    }
    
    fileprivate func configureRefreshControl(_ tableView: UITableView){
        print(#fileID, #function, #line, "")
        let myRefresh = UIRefreshControl()
        myRefresh.tintColor = #colorLiteral(red: 1, green: 0.5433388929, blue: 0, alpha: 1)
        refreshControlHelper.refreshControl = myRefresh
        refreshControlHelper.parentContentView = self
        myRefresh.addTarget(refreshControlHelper, action: #selector(RefreshControlHelper.didRefresh), for: .valueChanged)
        tableView.refreshControl = myRefresh
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
