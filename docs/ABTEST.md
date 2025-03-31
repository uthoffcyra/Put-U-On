# Put U On: A/B Test Proposals

## Michael's Proposal

### A/B Test Name:
Login/Signup screen background color
### User Story Number:
US1 - Account creation
### Metrics:
retention, task success
### Hypothesis:
This A/B test will be addressing is the potential impact of the Login/Signup page background color on user engagement and conversion rates. A less visually appealing or less readable background may cause hesitation or cognitive friction, leading users to drop off before completing the signup or login process. A high drop-off rate on the Login/Signup page can directly impact user acquisition and retention. If users abandon the process at this stage, they may never experience the core features of the app, leading to lost potential engagement and revenue. Since the Login/Signup page is one of the first interactions users have with the app, optimizing it for better visual appeal and usability could improve overall sign-up rates and app adoption. Changing the background color of the Login/Signup page from its current state to either a dark purple or dark green will impact user engagement and conversion rates. Specifically, we hypothesize that a dark purple background will result in higher signup and login completion rates compared to a dark green background due to its association with creativity and entertainment, making it more visually appealing and encouraging for users in a music-related app.
### Experiment:
The experiment will involve creating an A/B test in firebase that contains two variants; a base variant with the dark purple, and a variable group with a dark green background color. The test will be deployed to all users of the app, allowing for most effective testing and meaningful results from the entire userbase. We will track the retention over 2-3 days, and if retention drops or raises for one group over the other, this will provide insights as to which variant the users like more. We will also track the task completion of both logging in and signing up. 
### Variations:
Some variations we could test different colors for the background of the login/signup page. If, in one experiement, a color performs better than the other, we could then put that winning color against another color. We could continue this process to refine our results.

## Cyra's Proposal

### A/B Test Name:
User Settings Layout Experiment
### User Story Number:
US-5 User Settings
### Hypothesis:
We believe that reorganizing the layout of the User Settings tab will improve user engagement by reducing cognitive load and putting more important tasks at the top of their preferences. Buttons should also be reflective of what pages to go to and what they do. A well-organized settings screen makes it easier for users to navigate, find, and adjust their preferences quickly. When the layout is intuitive, users don’t have to waste time searching for specific options, which leads to a smoother, more positive experience. If the settings are disorganized or overwhelming, it can cause frustration and lead users to abandon or avoid changing settings altogether.
### Experiment:
- Current Layout (Control): The current settings layout with standard buttons.
- Simplified Layout (Variant): A new layout that consolidates the most important settings into a single scrollable screen with categorized cards for each section (e.g., Account, Spotify, Notifications).
### Variations:
Some variations could be in the order of these tasks, or a search feature that could go between them. Letting users easily navigate settings reduces frustration and can increases user happiness. 


## Emily's Proposal

### A/B Test Name: 
Spotify Log In Button Color Change
### User Story Number:
US1 - User Account Creation
### Hypothesis:
Changing the Spotify login button color from green to orange will increase the login conversion rate by making the button stand out more and drawing users' attention. If the orange button outperforms the green button in conversion rate, it suggests that the color change positively impacts user engagement.
### Experiment:
The experiment will involve two groups: a control group (A) that sees the existing green Spotify login button and a variant group (B) that sees an orange version of the button. Users will be randomly assigned to either group to ensure unbiased results. The test will run for a set duration, such as two to four weeks, to collect a statistically significant amount of data. The primary success metric will be the login conversion rate, measured as the percentage of users who click the button and successfully log in, while a secondary metric will be the click-through rate (CTR) on the login button. Data collection will involve tracking the number of users exposed to each button color, along with the corresponding clicks and successful logins. The results will be analyzed using statistical significance testing, such as a chi-square test or t-test, to determine whether the orange button leads to a meaningful increase in logins compared to the green button. If the orange button significantly improves the conversion rate, it may be considered for permanent implementation; otherwise, the green button will be retained.
### Variations:
The experiment will have two variations: the control version, where users see the existing green Spotify login button, and the test version, where users see an orange login button.

## Omar's Proposal

### A/B Test Name:
NPS Rating UI Optimization
### User Story Number:
US 5 - Net Promoter Score
### Hypothesis:
If users rate their experience using clickable number boxes instead of a slider, they will be more likely to complete the Net Promoter Score (NPS) survey and provide higher ratings due to reduced friction and better usability.
### Experiment:
We will run an A/B test comparing two versions of the NPS rating interface:

-Version A (Control): Users select their rating (0–10) using a slider.

-Version B (Test Group): Users select their rating by clicking numbered boxes (0–10) instead of dragging a slider.

### Variations

Variation A (Control): Traditional slider-based NPS survey.

Variation B (Test Group): Clickable number boxes replacing the slider.

### Marcus's Proposal
A/B Test Name:
Onboarding Progress Bar Visibility

### User Story Number:
US-2 Adoption

### Hypothesis:
Showing a visible progress bar during onboarding will increase adoption by giving users a clearer sense of how many steps are left, reducing perceived effort and abandonment. Users are more likely to complete onboarding when they understand their progress. We hypothesize that a visible progress bar will lead to a higher onboarding completion rate compared to no progress bar.

### Experiment:
We’ll run an A/B test using Firebase Remote Config and Firebase Analytics.

Audience: 100% of new users split evenly between control and variant groups (50/50 split).

Control (A): Existing onboarding flow without a visible progress bar.

Variant (B): Onboarding flow with a visible progress bar at the top of each screen, showing total steps (e.g., “Step 2 of 4”).

We’ll track:

Onboarding completion rate

Time spent on each step

Drop-off points per step

Adoption metrics (users who complete onboarding and perform at least one key action, such as adding a profile or linking a service)

### Variant: Onboarding screens with a visible progress bar (e.g., “Step 2 of 4”) shown at the top.

### Variations:
We can test different styles of progress indicators (linear bar, step dots, or text only). Future variations might explore how labeling each step affects completion rates.
