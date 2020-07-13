# SwiftUIPullToRefresh

SwiftUIPullToRefresh is designed for 'pull to refresh' feature for List and ScrollView elements in SwiftUI.

## Installation

Swift Package Manager

You should use Xcode 11 to open your project. Click File -> Swift Packages -> Add Package Dependency, enter CocoaPods repo's URL. Or you can login Xcode with your GitHub account and just type CocoaPods to search.

```
https://github.com/muhammedtanriverdi/SwiftUIPullToRefresh.git
```

## Usage

![](https://giphy.com/gifs/fsEddJe0fVeuG3gWFr/html5)

ScrollView

```
	@EnvironmentObject var viewModel: ViewModel

	ScrollView {
            ForEach(viewModel.data) { item in
                ...
            } 
        } 
        .background(SwiftUIPullToRefresh(action: {
            viewModel.reloadData()
        }, isShowing: $viewModel.dataIsLoading))

```

List

```
	@EnvironmentObject var viewModel: ViewModel

	List (viewModel.data) { item in
           ...
        } 
        .background(SwiftUIPullToRefresh(action: {
            viewModel.reloadData()
        }, isShowing: $viewModel.dataIsLoading))

```


## Licence
SwiftUIPullToRefresh is available under the MIT license. See the LICENSE file for more info.

