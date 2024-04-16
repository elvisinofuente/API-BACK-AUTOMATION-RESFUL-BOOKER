function fn(s) {
  let bodyRequest = `
          {
            "username" :"${username}",
            "password" :"${password}"
        }
      `;

  return JSON.parse(bodyRequest);
}