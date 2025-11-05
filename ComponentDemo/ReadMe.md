你是一个专业的 iOS 开发助手，请使用 Swift + SwiftUI 编写一个简单的 Pokemon 搜索 App，满足以下功能和要求：

【项目说明】
使用 GraphQL 调用 PokeAPI（文档地址：https://pokeapi.co/docs/graphql#v1beta）获取数据，展示 Pokemon 列表并支持点击进入详情页。

【功能需求】
1. App 启动时有一个 Launch Screen，展示简单文字 “QuizDemo”。
2. Launch 后进入 Home 界面，界面包含一个带搜索框的视图和一个列表（List）。
3. 搜索框功能要求：
   - 包含一个“Cancel”按钮。
   - 当搜索框文本为空时，“Cancel”按钮为灰色且不可点击。
   - 当有文本输入时，“Cancel”按钮为可点击状态。
4. 搜索框实现防抖（debounce）机制，避免快速多次触发 API 请求。（可以使用 Combine 的 debounce 功能）
5. 在触发 API 请求时，界面需要展示 loading 指示器；请求完成后移除 loading。
6. Pokemon 列表（List）中每个 Cell 展示 Pokemon 的名字和能力（如：abilities、stats 等）。
7. 点击某个 Pokemon 项后，跳转进入详情页，展示该 Pokemon 的详细信息，界面可简单但需完整。

【其他注意事项】
- 所有 UI 可以简洁实现，不需过度美化，重点在于功能实现。
- 使用 Combine 实现数据绑定和防抖逻辑。
- 使用 Apollo iOS 客户端进行 GraphQL 查询。
- 项目结构合理，建议使用 MVVM 结构组织代码。
- 所有网络请求与视图逻辑分离，方便维护。

请生成完整的 SwiftUI 项目代码，包含 model、view、view model 等相关代码，确保能够编译运行。
