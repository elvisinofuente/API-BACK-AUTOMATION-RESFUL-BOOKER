function fn(s) {
  let bodyRequest = `
          {
            "firstname" :"${firstname}",
            "lastname" :"${lastname}",
            "totalprice" :"${totalprice}",
            "depositpaid" :"${depositpaid}",
            "bookingdates" : {
                "checkin" : "${checkin}",
                "checkout" : "${checkout}"
            },
            "additionalneeds" : "${additionalneeds}"
        }
      `;

  return JSON.parse(bodyRequest);
}