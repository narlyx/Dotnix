import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { bind } from "astal"
import Hyprland from "gi://AstalHyprland"

// Vars
const { TOP, LEFT, RIGHT, BOTTOM } = Astal.WindowAnchor
const { START, CENTER, END } = Gtk.Align

const hyprland = Hyprland.get_default()

// Hyprland workspaces
function Workspaces() {
  return (
    <box className={"Workspaces"}>
      {bind(hyprland, "workspaces").as(wss => wss
        .filter(ws => !(ws.id >= -99 && ws.id <= -2))
        .sort((a, b) => a.id - b.id)
        .map(ws => (
          <button
            className={bind(hyprland, "focusedWorkspace")
              .as(fw => ws === fw ? "focused":"")}>
            <box>{bind(hyprland, "focusedWorkspace").as(fw => ws === fw ? ws.id+": "+ws.name:ws.id)}</box>
          </button>
        )))}
    </box>
  )
}

// Entry point
export default function Bar(monitor: Gdk.Monitor) {
  return (
    <window
      className={"Bar"}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      gdkmonitor={monitor}
      anchor={TOP|LEFT|RIGHT}
      application={App}>
      <centerbox>
        <box hexpand halign={START}>
          {/* Left modules */}
          <Workspaces />
        </box>
        <box halign={CENTER}>
          {/* Center modules */}
        </box>
        <box hexpand halign={END}>
          {/* Right modules */}
        </box>
      </centerbox>
    </window>
  )
}
