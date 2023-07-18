如何创建和排版自定义视图？
===

SwifUI 的一个核心原则是组成，这意味着它为我们设计了许多小视图，然后将它们与它们组合在一起，以创造更大的东西。 这使我们能够在大规模的规模上重新使用视图，这意味着对我们的工作较少。 甚至更好，结合小子视图几乎没有运行时开销，所以我们可以自由使用它们。

关键是从小事做起，逐步提升。例如，许多应用程序必须与以下类似的员工一起工作：

```swift
struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}
```

如果您希望在应用程序中具有一致的员工配置文件的设计，则可以使用圆形形状创建一个 `100x100` 图像视图：

```swift
struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}
```

您的设计师可能会告诉您，每当可见电子邮件地址时，你应该显示一个小信封图标旁边作为一个视觉提示，所以你可以做一个 `EmailAddress` 视图：
```swift
struct EmailAddress: View {
    var address: String

    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}
```

展示员工的详细信息时，您可以创建一个查看的视图，该视图具有整洁的姓名和职位标题，使用电子邮件地址备份，使用您的 `EmailAddress` 视图，如下所示：

```swift
struct EmployeeDetails: View {
    var employee: Employee

    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(employee.jobTitle)
                .foregroundColor(.secondary)
            EmailAddress(address: employee.emailAddress)
        }
    }
}
```

你甚至可以创建一个更大的视图，将 `ProfilePicture` 放在 `EmployeeDetails` 旁边，以便提供员工的单一视觉表现，如下所示：

```swift
struct EmployeeView: View {
    var employee: Employee

    var body: some View {
        HStack {
            ProfilePicture(imageName: employee.profilePicture)
            EmployeeDetails(employee: employee)
        }
    }
}
```

通过这种结构，我们现在有几种方式显示员工：

- 只是他们的照片
- 只是他们的电子邮件地址
- 只是他们的工作细节
- 一次性完成所有事情

更重要的是，这意味着当使用所有这些工作时，我们的主要内容视图不必担心员工的外观或应该如何对待他们 - 所有这些工作都被整合到我们的较小视图中。这意味着我们可以创建一个带有示例员工的 `EmployeeView` ，并让它正常工作。

要一起演示所有这些，这里有一个代码示例，其中包含所有较小的视图结构，以显示单个员工的 `ContentView` 结构结尾。 对于用户来说，结果是相同的，但我们最终通过一系列的小视图来做个体的东西，每个都可以以任何数量的不同方式重新组合。

这是代码：

```swift
struct Employee {
    var name: String
    var jobTitle: String
    var emailAddress: String
    var profilePicture: String
}

struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct EmailAddress: View {
    var address: String

    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct EmployeeDetails: View {
    var employee: Employee

    var body: some View {
        VStack(alignment: .leading) {
            Text(employee.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(employee.jobTitle)
                .foregroundColor(.secondary)
            EmailAddress(address: employee.emailAddress)
        }
    }
}

struct EmployeeView: View {
    var employee: Employee

    var body: some View {
        HStack {
            ProfilePicture(imageName: employee.profilePicture)
            EmployeeDetails(employee: employee)
        }
    }
}

struct ContentView: View {
    let employee = Employee(name: "hello world", jobTitle: "Editor, Hacking with Swift", emailAddress: "wowohoo@qq.com", profilePicture: "paul-hudson")

    var body: some View {
        EmployeeView(employee: employee)
    }
}
```
