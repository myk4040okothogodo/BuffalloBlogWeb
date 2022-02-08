package models


import ( "github.com/gofrs/uuid" )

func (ms *ModelSuite) Test_Address() {
	ms.Fail("This test needs to be implemented!")

  a := &Address{
      Street: "1 Main Street",
      City: "EveryTown",
      State: "IL",
      Zip: "12345",

  }

  u := &User{
      FirstName: "Joe",
      LastName:  "Smith",
      Age:       25,
      UserAddress: *a,

  }

  db := ms.DB
  verrs, err := db.Eager().ValidateAndCreate(u)
  if err != nil {
      panic(err)

  }

  ms.NotEqual(uuid.Nil, u.UserAddress.ID, "Address ID is generated when saved to DB")
  ms.False(verrs.HasAny(), "Address and user creation have no validation Errors")

  a2 := &Address{}
  db.Eager().Find(a2, u.UserAddress.ID)

  ms.Equal(u.UserAddress.ID, a2.ID, "FInd Addresss in database using ID".)
  ms.Equal("Joe smith", a2.User.FullName(), "User is loaded with Address.")
}
