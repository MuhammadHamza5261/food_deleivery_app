class Singleton{

   Singleton._privateConstructor();

   static final Singleton _instance = Singleton._privateConstructor();

   static Singleton get instance => _instance;


    String? email;
    String? name;


     void setUser(String name, String email){
        this.name = name;
       this.email = email;

     }


   void clear() {
     name = null;
     email = null;
   }

   bool get isLoggedIn => name != null && email != null;



}