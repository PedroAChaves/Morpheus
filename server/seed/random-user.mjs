import axios from 'axios'
import pkg from 'gerador-validador-cpf'
const { generate } = pkg

const users = []

async function fetchUser() {
  try {

    const result = (await axios.get('https://randomuser.me/api/?nat=br&results=14')).data.results

    for (const user of result) {
      users.push({
        gender: user.gender,
        email: user.email,
        name: user.name,
        birthDate: user.dob.date,
        avatarUrl: user.picture.large,
        cell: user.cell,
        document: generate({ format: true }),
        name: ''.concat(user.name.first, user.name.last).replace(/[A-Z]/g, ' $&').trim()
      })

      await axios.post('http://localhost:3000/accounts', {
        id: user.login.uuid,
        gender: user.gender,
        email: user.email,
        name: user.name,
        birthDate: user.dob.date,
        avatarUrl: user.picture.large,
        cell: user.cell,
        document: generate({ format: true }),
        name: ''.concat(user.name.first, user.name.last).replace(/[A-Z]/g, ' $&').trim()
      })
    }
    
  } catch (error) {
    console.log(error);
  }

  console.log(users);
}

; (async () => await fetchUser())()