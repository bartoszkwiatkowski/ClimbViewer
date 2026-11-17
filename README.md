# CLIMB-VIEWER

A lightweight tool which allows to view the full elevation graph on the selected road segment. Fully dynamic view - zoomable and movable.

A zoomable gradient chart for road climbs. Pick a climb on the map (or drop a GPX file). The chart starts with 1 km bars for the whole climb. Zoom in to see 100 m bars, or 50 m bars where detailed elevation data exists, and find the steep ramps that a 1 km average hides.

It's a single static page (`index.html`): no build step, no server code, no API keys.

## How to use

1. Search for a place, then click the **start** and the **top** of the climb on the map. The route follows roads (BRouter).
   - **Wrong road?** Click the road you want on the map to add a numbered via point. The route is forced through it, which is useful for small or narrow roads the router avoids. You can add up to 20 via points. Drag any pin to move it; click a via pin to remove it.
2. Zoom the chart with the mouse wheel. Drag to pan. Click a bar to zoom into it. **◀ Back** goes to the previous view.
3. **Last 1 km** and **Steepest 1 km** are toggles: click again to go back.
4. Hover over the chart to see the elevation, the gradient at that point (over 100 m), and the gradient of the bar.
5. The link in the address bar holds the route, including via points, so you can share a link to a specific climb.

## Data sources

| What | Source |
| --- | --- |
| Elevation, France | IGN RGE ALTI (1–5 m terrain model) |
| Elevation, Spain, Balearics & Canaries | IGN España MDT05 (5 m LiDAR terrain model) |
| Elevation, Poland | GUGiK NMT (~1 m LiDAR terrain model) |
| Elevation, elsewhere | AWS Terrain Tiles (mostly 10–30 m; bars under ~200 m are approximate) |
| Routing | BRouter (brouter.de), with OSRM bike routing as a backup |
| Place search | Nominatim (OpenStreetMap), with Photon as a backup |
| Maps | OpenStreetMap, OSM France, OSM Germany, CyclOSM, OpenTopoMap, Esri World Topo |

All are free public services. Please keep usage light: they're run as community services.

## Run locally

You need Python 3 for the local web server.

- **Windows:** double-click `serve.cmd`. It starts a server and opens `http://localhost:8765/`. Close the window to stop it.
- **macOS / Linux:** in the repository folder, run `python3 -m http.server 8765 --bind 127.0.0.1`, then open `http://localhost:8765/`.

Opening `index.html` straight from disk also works, but OpenStreetMap blocks map tiles for pages opened from disk, so the OSM France map is used instead.
