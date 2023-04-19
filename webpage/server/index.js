const express = require("express");

const PORT = process.env.PORT || 3001;

const app = express();

const apple = {
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
};

app.get("/.well-known/apple-app-site-association", (req, res) => {
  res.json(apple);
});

app.listen(PORT, () => {
  console.log(`Server listening on ${PORT}`);
});
