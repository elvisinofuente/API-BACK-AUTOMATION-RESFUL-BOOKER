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

      if (caso === "CreateBooking_IncorrectField"){
        bodyRequest = bodyRequest.replace("firstname", "nuevocampo");
      }
      if (caso === "CreateBooking_WithOutField"){
        bodyRequest = `{}`;
      }

  return JSON.parse(bodyRequest);
}