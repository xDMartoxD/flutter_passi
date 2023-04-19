import { useState } from "react";
import reactLogo from "./assets/react.svg";
import "./App.css";
import { BrowserRouter, Route } from "react-router-dom";

function App() {
  const [count, setCount] = useState(0);

  return (
    <div className="App">
      <BrowserRouter>
        <switch>
          <Route path="/">
            <div>
              <a href="https://vitejs.dev" target="_blank">
                <img src="/vite.svg" className="logo" alt="Vite logo" />
              </a>
              <a href="https://reactjs.org" target="_blank">
                <img src={reactLogo} className="logo react" alt="React logo" />
              </a>
            </div>
            <h1>Vite + React</h1>
            <div className="card">
              <button onClick={() => setCount((count) => count + 1)}>
                count is {count}
              </button>
              <p>
                Edit <code>src/App.tsx</code> and save to test HMR
              </p>
            </div>
            <p className="read-the-docs">
              Click on the Vite and React logos to learn more
            </p>
          </Route>
          <Route
            path="/.well-know/assetlinks.json"
            action={async ({ params, request }) => {
              return;
            }}
          ></Route>
          {/* <Route
            path="/.well-know/apple-app-site-association"
            action={async ({ params, request }) => {
              return new Response(
                JSON.stringify({
                  applinks: {
                    details: [
                      {
                        appIDs: ["1595696436.com.m.restrepom.passi"],
                        components: [
                          {
                            "#": "no_universal_links",
                            exclude: true,
                            comment:
                              "Matches any URL with a fragment that equals no_universal_links and instructs the system not to open it as a universal link.",
                          },
                          {
                            "/": "/event-details/*",
                            comment:
                              "Matches any URL with a path that starts with /event-details/.",
                          },
                        ],
                      },
                    ],
                  },
                  webcredentials: {
                    apps: ["1595696436.com.m.restrepom.passi"],
                  },
                }),
                {
                  status: 200,
                  headers: {
                    "Content-Type": "application/json",
                  },
                }
              );
            }}
          ></Route> */}
        </switch>
      </BrowserRouter>
    </div>
  );
}

export default App;
