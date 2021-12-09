async function getPeople() {
    let response = await axios.get('/api/people');
    return response.data;
}

async function getInterests() {
    let response = await axios.get('/api/interests');
    return response.data;
}

async function getInterestsForOnePerson(personId) {
    let response = await axios.get('/api/interests/' + personId);
    return response.data;
}

async function getPeopleForOneInterest(interestId) {
    let response = await axios.get('/api/people/' + interestId);
    return response.data;
}

async function addInterestForOnePerson(personId, interestId) {
    const obj = { personId, interestId };
    let response = await axios.put('/api/personinterest/', obj);

}

/*
    getData();
    async function getData() {
        let response = await axios.get('/api/peopleinterest');
        console.log(response.data);
    }

    putData();
    async function putData() {
        let data = { person: 'Knut', interest: 'Fallskjermhopping'};
        let response = await axios.put('/api/peopleinterest', data);
        console.log(response.data);
    }
 */