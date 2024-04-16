function fn(s) {
  let bodyRequest = `
          {
            "firstname" :"${firstname}Update",
            "lastname" :"${lastname}Update",
            "totalprice" :"${totalprice}",
            "depositpaid" :"${depositpaid}",
            "bookingdates" : {
                "checkin" : "${checkin}",
                "checkout" : "${checkout}"
            },
            "additionalneeds" : "${additionalneeds}Update"
        }
      `;
      if (caso === "Update_WithDataInvalid"){
        bodyRequest = `
          {
            "firstname" :12112,
            "lastname" :23232,
            "totalprice" :"precio",
            "depositpaid" :"esfalso",
            "bookingdates" : {
                "checkin" : 121,
                "checkout" : 1212
            },
            "additionalneeds" : 21212
        }
      `;
      }

  return JSON.parse(bodyRequest);
}