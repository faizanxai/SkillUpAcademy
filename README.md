# SkillUpAcademy
A native SwiftUI app for browsing courses, managing favorites, and accessing course data offline

# Task 1
Created a course model to store information about each course.
Added some sample courses inside viewmodel to display in the app.
Organized the code into MVVM to make it easier to manage and understand.
Inside views folder made a reusable view(coursesCardView) component and utilised it to list different courses in CoursesListView

# Task 2
Replaced sample data with a real API call.
Wrote a defaultCourseFetcher service using URLSession and async/await and decoded the response into Course objects with JSONDecoder.
Added a typed APIError enum so network and decoding failures give clear messages.
Gave CoursesViewModel a state machine (idle → loading → loaded → error) and made the view react to each one — spinner while loading, list on success, error screen with Retry on failure.
Initial fetch fires from .task on the view.

# Task 3
Added a FavouritesViewModel to track favourited course IDs.
Persisted favourites locally so they survive app restarts.
Built a reusable FavoriteButton and added it to coursesCardView.
Made a FavouritesScreen that filters courses down to only the favourited ones.
Wrapped everything in a TabView with Courses and Favourites tabs.

# Task 4
Added a CourseCache service to save and load courses locally as JSON.
After every successful fetch, courses are encoded and written to cachedCourses.json in the app's Documents directory.
If the network fails on launch, the view model loads the cached file instead of showing an error.
Added an isShowingCachedData flag to the view model.
When cached data is being shown, a gray banner appears above the list saying "Offline mode – showing cached courses".
The banner disappears on a successful retry and the cache file is overwritten with the fresh data.
