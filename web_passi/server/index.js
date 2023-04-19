import express from "express";
import path from "path";
import homepageRouter from "./homepageRouter.js";
import assetsRouter from "./assetsRouter.js";

const port = process.env.PORT || 3000;
const publicPath = path.join(path.resolve(), "public");
const distPath = path.join(path.resolve(), "dist");

const app = express();

app.get("/.well-known/apple-app-site-association", (_req, res) => {
  res.json({
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
  });
});
app.get("/.well-known/assetlinks.json", (_req, res) => {
  res.json([
    {
      relation: ["delegate_permission/common.handle_all_urls"],
      target: {
        namespace: "android_app",
        package_name: "com.passiapp",
        sha256_cert_fingerprints: [
          "01:CD:23:0A:17:9F:A1:62:EA:07:D2:EF:71:9F:C4:14:F8:6D:A1:39:02:BC:AE:D8:57:F8:DC:92:38:1A:C8:E7",
        ],
      },
    },
  ]);
});
if (process.env.NODE_ENV === "production") {
  app.use("/", express.static(distPath));
} else {
  app.use("/", express.static(publicPath));
  app.use("/src", assetsRouter);
}
app.use(homepageRouter);

app.listen(port, () => {
  console.log("Server listening on port", port);
});
