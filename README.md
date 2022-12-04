# A small puzzle to test ReScript + React

## Compilation of the frontend:

installation with `npm`:
```
cd frontend
npm install rescript
npm run build
npm run tests
npm run deploy
```

The static file needed to run the front end are in frontend/dist

## Compilation of the backend:

Install ocaml via opam and run
```
cd backend
opam install dune tiny_httpd caqti ppx_rapper_lwt ppx_rapper.runtime caqti-driver-postgresql yojson pacomb
dune build
```

You can start the back-end with
```
dune exec src/backend.exe
```

Then, you can open http://localhost:8080/ on your favorite browser

## Details:

The backend provides the static files and the frontend and backend communicate
via the following API:

- POST `/send_problem` with a JSON body containing
  ```
  { left:  /string representing the right member of the problem/,
    right: /string representing the left member of the problem/,
    domain: /array of integer which are all the walut we must use in the
           solution/
  }
  ```
  a unique id and creation timestamp is stored in the data base.
  Example:
  ```
  { left: "a+b"
    right: "c-3"
    domain; [1,2,3]
  }
  ```
  This request returns the id of the generated problem as JSON

- GET `/get_problem?id=N`
  to retrive the Nth problem. It returns the same json as above.

- POST /send_solution with a JSON body containing
  ```
  { problem: /the id of the problem/,
    auto: /boolean telling if the solution was produce automatically/,
	env: /the value of the variables in the problem as a dictionnary/
  }
  ```
  This request returns nothing.