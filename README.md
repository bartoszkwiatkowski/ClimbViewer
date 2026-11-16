# ClimbViewer

A lightweight tool which allows to view the full elevation graph on the selected road segment. Fully dynamic view - zoomable and movable.

A zoomable gradient chart for road climbs. Pick a climb on the map (or drop a GPX file). The chart starts with 1 km bars for the whole climb. Zoom in to see 100 m bars, or 50 m bars where detailed elevation data exists, and find the steep ramps that a 1 km average hides.

It's a single static page (`index.html`): no build step, no server code, no API keys.

## How to use

1. Search for a place, then click the **start** and the **top** of the climb on the map. The route follows roads (BRouter).
2. Zoom the chart with the mouse wheel. Drag to pan. Click a bar to zoom into it. **◀ Back** goes to the previous view.
3. **Last 1 km** and **Steepest 1 km** are toggles: click again to go back.
4. Hover over the chart to see the elevation, the gradient at that point (over 100 m), and the gradient of the bar.
5. The link in the address bar holds the route, so you can share a link to a specific climb.

## Data sources

| What | Source |
| --- | --- |
| Elevation, France | IGN RGE ALTI (1–5 m terrain model) |
| Elevation, Poland | GUGiK NMT (~1 m LiDAR terrain model) |
| Elevation, elsewhere | AWS Terrain Tiles (mostly 10–30 m; bars under ~200 m are approximate) |
| Routing | BRouter (brouter.de), with OSRM bike routing as a backup |
| Place search | Nominatim (OpenStreetMap), with Photon as a backup |
| Maps | OpenStreetMap, OSM France, OSM Germany, CyclOSM, OpenTopoMap, Esri World Topo |

All are free public services. Please keep usage light: they're run as community services.

## Publish on GitHub Pages

1. On github.com, create a new **public** repository, e.g. `ClimbViewer`.
2. Click **uploading an existing file** and drag in `index.html`, `README.md` and `serve.cmd`. You can also add `.nojekyll`; it's optional. Then commit.
3. Go to **Settings → Pages**. Under **Build and deployment**, set **Source: Deploy from a branch** and **Branch: `main` / `(root)`**, then click **Save**.
4. After about a minute the site is live at `https://<your-username>.github.io/ClimbViewer/`.

To update the site, upload a new `index.html` to the repository. The site refreshes within a minute or so.

## Run locally

Double-click `serve.cmd`, which opens `http://localhost:8765/`. Opening `index.html` straight from disk also works, but OpenStreetMap blocks map tiles for pages opened from disk, so the OSM France map is used instead.
