# Version Control Branching Strategies <br />


## Strategy 1: Trunk-based Development
---
Trunk based development means that all developers will work on the same branch, and when changes are tested and are ready, the developer will push their code into the central repo. 
### Pros
- works well with smaller organizations, and those with stronger internal testing practices, as it simplifies complexity of pushing code
- more focus on one detail of the project, so all members can focus on the development of that one problem
- Really good development if each developer is good about testing their code
### Cons
- Comes with large risks, pushing directly to main branch/repo means mistakes can be detremental, or harder to reverse
- larger development struggle with this strategy
- One individual can slow down or stop development for a little bit

## Strategy 2: Release Branching
---
Release branching refers to the project development where a "release" is contained within a branch. When a team starts working on a new release, a branch is created with the release. A team will do all work on that "release" branch until the next release is able to be created.
### Pros
- If the application needs to support multiple versions, or have many differing needs based on versions due to specific consumer demands, release branching is efficient
- Release branching allows the team to focus on specific issues, patches or features per release
- smaller updates to applications can be tracked and organized through release branching
### Cons
- Release branching can be hard to manage with many people working on the same branch
- release cycles should be no more than two weeks, if it is to be efficient
- instability can occur when when there are many contributors
- if multiple releases need to be maintained, it can create more work for teams

## Strategy 3: Feature Branching
---
Feature branching allows developers to create a branch for each specific feature or task. Teams can be split up to work on features and tasks. These branches can then be "toggled" and apply on or off to the main applicatoin. 
### Pros
- Gives release manager large flexability on what to merge and what to accept
- lowest level of branching, each issue has its own branch
- multiple users and developers can work at once, each on different branches
- workflow can be assigned to all developers, and changes on each branch are merged onto the main branch when completed
- easily segements work
- subteams can easily be created
### Cons
- Feature branching is hard to implement and requires a lot of commitment from the whole team
- release manager has more options, but will involve a lot more complexities with all the branches to merge
- can get confusing very quickly if not organized
- poorly developed branches can be a nightmare to merge
- when a developer works on a branch for a long period of time without communications it can be really hard to merge it with the main branch
- requires a very solid and frequent communication among the developers


## Selected Strategy: Feature Branching
---

### Reasoning
Feature branching is ideal for our scheduler application because feature branching will allow our team to split into subgroups and work on multiple issues at once. For example, at one point in time, a team could be testing bugs as a QA on a branch, while a team is fixing bugs, and while a team is coding a completely new feature. By using feature branching, it can help split up workflow so that everyone is efficiently working, and allow for managers to have more control over teams to help aid coordination. Our project will come to a point in time where multiple features should be developed at once because there is many features, and not much time. Feature branching allows for this to happen.

### Adding Features
New branches can be created to add new features, and sub branches of the feature branch can be used to track and merge each change to that feature. This will allow for all changes to be checked and recorded, and mistakes would not break or take copious amounts of time to fix. This will also allow a feature branch team to work all at once on the feature. Ideally, each small sub team working on a feature branch will have a leader which enforces time constraints, and commits the merges of sub branches to the feature branch. Merges of feature branches to the main branch will be finalized by the release manager.

### Resolving Bugs
Resolving bugs will involve a new branch for the specific bug to be made. A sub team will be created to solve the bug on that seperate branch, and the release manager will finailize the merge of the bug fix into the main branch. Resolving bugs will most likely require small teams, or a single developer to fix the issue. Every single bug should require a new branch to be created, reviewed, and merged. If there are many bugs, a "patch" branch, or a branch that includes many bug fixes can be created, which will include a team of developers creating sub branches of the bugs to include into the large "patch" branch. The "patch" branch which includes many bug fixes will then be reviewed and finalized by the release manager to be merged into the main branch.

### Managing Releases
Feature branching normally does not include release branches, but our application might need to have multiple active instances as there will be specific consumer needs for a specific release, or that multiple versions of the application need to be active at once. There should be releases created based on features added. A release branch of the main branch will be created after each feature, and its bug fixes and testing is completed. A relase branch needs to be fully functional, and without as many bugs as possible. Release branches will not be altered after creation, and if a hotfix, or bug fix update needs to be applied to the release, a new release with a higher point version (such as 1.0.0 to 1.0.1) will be created to take its place. Ideally, there will be a release of the application for each feature added, and each release will be stable, and usable when ever needed. 



