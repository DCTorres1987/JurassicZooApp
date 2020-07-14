Use the Ruby on Rails framework.

Your models must:

[X] Include at least one has_many, at least one belongs_to, and at least two has_many :through relationships 

        *** User belongs to a Zoo 
        *** Attraction has many Tickets 
        *** User has many Dinosaurs, through Feedings 
        *** User has many Attractions, through Tickets 

[X]  Include a many-to-many relationship implemented with has_many :through associations. The join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

        ***utilizing through tickets index. retrieving attractions through tickets users's have purchased
        ***utilizing through feeding index. retrieving dinosaur name through user's feeding dinosaurs


[X]  Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

        *** added an validation to ensure null values can't be entered for username and password in controller folder

[X]  You must include at least one class level ActiveRecord scope method. 
    [X] a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).
        
        **** Created an scope in the Review model to filter reveiws on the review index page

[X]  Your application must provide standard user authentication, including signup, login, logout, and passwords.

        *** have standard authentication. signup, login, logout, and password.

[X]  Your amuthentication system must also allow login from soe other service. Facebook, Twitter, Foursquare, Github, etc

        *** user can login using github

[X]  You must include and make use of a nested resource with the appropriate RESTful URLs.

        *** make sure routes are restful

    [X] You must include a nested new route with form that relates to the parent resource
    
        *** feeding is nested under user that tracks dinosaurs that are being fed by user

    [X] You must include a nested index or show route
    
        *** tickets [index, show] and review [index, show] is nested under User

[X]  Your forms should correctly display validation errors.

        *** new pages review, feeding, tickets, and user display errors when submitted without meeting required fields 

[X]  Your fields should be enclosed within a fields_with_errors class

        *** rendering field with errors in new user form

[X]  Error messages describing the validation failures must be present within the view.

        *** errors are displaying when forms submitted without required values

[X]  Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

        *** my code in the controllers are DRY

[X]  Logic present in yours controllers should be encapsulated as methods in your models.

        ***methods are encapsulated in all my controller models

[X]  Your views should use helper methods and partials when appropriate.

        *** using helper methods for session and review. Also rendering partials in the new forms for errors.

[X]  Follow patterns in the Rails Style Guide and the Ruby Style Guide.

        *** I followed Rails Style Guide

[X]  Do not use scaffolding to build your project. Your goal here is to learn. Scaffold is a way to get up and running quickly, but learning a lot is not one of the benefits of scaffolding.

        *** Did not user scaffolding 
