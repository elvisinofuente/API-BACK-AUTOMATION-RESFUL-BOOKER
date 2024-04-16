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

  return JSON.parse(bodyRequest);
}