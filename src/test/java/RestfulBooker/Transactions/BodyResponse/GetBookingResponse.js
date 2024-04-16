function fn(s) {
  let bodyRequest = `
  {
      "firstname" :"#string",
      "lastname" :"#string",
      "totalprice" :"#number",
      "depositpaid" :"#boolean",
      "bookingdates" : {
          "checkin" : "#string",
          "checkout" : "#string"
      },
      "additionalneeds" : "##string"
}
      `;

  return JSON.parse(bodyRequest);
}