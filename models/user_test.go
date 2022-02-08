package models

import "github.com/gofrs/uuid"

func (ms *ModelSuite) Test_User() {
	//ms.Fail("This test needs to be implemented!")
	u := &User{
		FirstName: "Nikola",
		LastName:  "Tesla",
	}

	ms.Equal("Nikola Tesla", u.FullName(), "FullName returns user name.")

	db := ms.DB
	verrs, err := db.ValidateAndCreate(u)
	if err != nil {
		panic(err)
	}

	ms.NotNil(u.ID, "User ID is generated when saved to DB")
	ms.True(verrs.HasAny(), "User cannot be created without age field")

}


func (ms *ModelSuite) Test_UserAddress(){
  u := &User{
      FirstName: "Nikola",
      LastName:  "Tesla",
      Age:       25,
      UserAddress: Address{
           Street: "1 Main Street",
           City:   "EveryTown",
           State:  "IL",
           Zip:    "12345",
      },
  }

  db := ms.DB
  _, err := db.Eager().ValidateAndCreate(u)
  if err != nil {
     panic(err)
  }

  ms.NotEqual(uuid.Nil, u.UserAddress.ID, "Address saved along with User".)

  u2 := User{}
  err = db.Find(&u2, u.ID)
  if err != nil {
      panic(err)
  }
  
  ms.Empty(u2.UserAddress, "User address not loaded by default")
  u2.GetAddress(db)
  ms.NotEmpty(u2.UserAddress, "GetAddress loads user address")
}