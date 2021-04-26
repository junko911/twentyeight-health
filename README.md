## Follow-up Questions
### Part 2
* How would you make this communication more secure?  Assume you can also implement changes at the remote URL.

_I would encrypt the JSON data and decrypt it at the remote URL. For example, [ActiveSupport::MessageVerifier](https://api.rubyonrails.org/v6.1.3.1/classes/ActiveSupport/MessageVerifier.html) could be a good candidate._

* How would you handle the remote URL being temporarily unavailable?

_I would use `rescue` to catch the errors like `status 500` and show the error message such as "The service is currently unavailable. Please try again later." to the user._

* How would you cover this with tests?

_I would write two tests: one is to check if patient data is successfully posted and a doctor is assigned to the patient. Another one is for unsuccessful submission (e.g., status 500)._

### Part 3
We have just been informed that certain products (such as individual birth control brands) cannot be offered in some states.  What types of questions come to mind?  How would you model this change?  Feel free to either implement in the codebase, sketch a diagram, or write your answer.

_I will add `has_many :states` association to `Product` and create a validation. When a patient chooses a `product`, the application will check if the `patient`'s `state` is included in the `product`'s `states`, and if not, it will show an error message saying the product cannot be offered in the patient's state._
