import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable, bind } from "astal"
import AstalHyprland from "gi://AstalHyprland"
import AstalTray from "gi://AstalTray"

function Launcher() {
  return (
    <box className="Launcher">
       
    </box>
  );
}

function SysTray() {
  const tray = AstalTray.get_default()

  return (
    <box className="SysTray">
      {bind(tray, "items").as(items => items.map(item => (
        <menubutton
          tooltipMarkup={bind(item, "tooltipMarkup")}
          usePopover={false}
          actionGroup={bind(item, "actionGroup").as(ag => ["dbusmenu", ag])}
    menuModel={bind(item, "menuModel")}>
          <icon gicon={bind(item, "gicon")} />
        </menubutton>
      )))}
    </box>
  );
}

function Workspaces() {
  const hypr = AstalHyprland.get_default()

  return (
    <box className="Workspaces">
      {bind(hypr, "workspaces").as(wss => wss
        .filter(ws => !(ws.id >= -99 && ws.id <= -2))
        .sort((a, b) => a.id - b.id)
        .map(ws => (
          <button
            className={bind(hypr, "focusedWorkspace").as(fw =>
              ws === fw ? "focused" : "")}
            onClicked={() => ws.focus()}>
            {ws.id}
          </button>
        ))
      )}
    </box>
  );
}

function FocusedClient() {
  const hypr = AstalHyprland.get_default()
  const focused = bind(hypr, "focusedClient")

  return (
    <box
      className="focused"
      visible={focused.as(Boolean)}>
      {focused.as(client => (
        client && <label label={bind(client, "title").as(String)} />
      ))}
    </box>
  );
}

export default function Bar(monitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      className="Bar"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP|LEFT|RIGHT}
      application={App}>
      <centerbox>
        <box hexpand halign={Gtk.Align.START}>
          <Launcher />
          <Workspaces />
        </box>
        <box>
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <SysTray />
        </box>
      </centerbox>
    </window>
  );
}
