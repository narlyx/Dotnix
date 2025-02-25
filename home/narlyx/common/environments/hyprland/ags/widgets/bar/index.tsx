import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { bind, Variable, GLib } from "astal"
import AstalHyprland from "gi://AstalHyprland"
import AstalTray from "gi://AstalTray"
import AstalBattery from "gi://AstalBattery"
import AstalWp from "gi://AstalWp"

// Global vars
const {TOP,LEFT,RIGHT} = Astal.WindowAnchor
const hypr = AstalHyprland.get_default()
const tray = AstalTray.get_default()
const bat = AstalBattery.get_default()
const speaker = AstalWp.get_default()?.audio.defaultSpeaker!

// Hyprland workspace module
function Workspaces() {
  return (
    <box className={"WorkspaceModule"}>
      {bind(hypr, "workspaces").as(wss => wss
        .filter(ws => !(ws.id >= -99 && ws.id <= -2))
        .sort((a,b) => a.id - b.id)
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
  )
}

// System tray module
function SysTray() {
  return (
    <box className={"SysTrayModule"}>
      {bind(tray, "items").as(items => items.map(item => (
        <menubutton
          tooltipMarkup={bind(item, "tooltipMarkup")}
          usePopover={false}
          actionGroup={bind(item, "actionGroup")
            .as(ag => ["dbusmenu",ag ])}
          menuModel={bind(item, "menuModel")}>
          <icon gicon={bind(item, "gicon")} />
        </menubutton>
      )))}
    </box>
  )
}

function Audio() {
  return (
    <box
      className={"Audio"}>
      <icon icon={bind(speaker, "volumeIcon")} />
      <label label={bind(speaker, "volume").as(p =>
        `${Math.floor(p * 100)}%`)} />
    </box>
  )
}

function Battery() {
  return (
    <box
      className={"Battery"}
      visible={bind(bat, "isPresent")}>
      <icon icon={bind(bat, "batteryIconName")} />
      <label label={bind(bat, "percentage").as(p =>
        `${Math.floor(p * 100)} %`)} />
    </box>
  )
}

// %a %b %e %I:%H %p
function Clock({format = "%I:%M %p"}) {
  const time = Variable<string>("").poll(1000, () =>
    GLib.DateTime.new_now_local().format(format)!)
  return (
    <box
      className={"ClockModule"}
      onDestroy={() => time.drop()}>
      <icon icon="clock" />
      <label>{time()}</label>
    </box>
  )
}

// Defines modules for the left side
function LeftModules() {
  return (
    <Workspaces />
  )
}

// Defines modules for the center
function CenterModules() {
  return (
    <label>
      Center
    </label>
  )
}

// Defines a window for the bar
function BarLayout(monitor: Gdk.Monitor) {
  return (
    <window
      className={"Bar"}
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP|LEFT|RIGHT}
      application={App}>
      <centerbox>
        <box hexpand halign={Gtk.Align.START}>
          <LeftModules />
        </box>
        <box>
          <CenterModules />
        </box>
        <box hexpand halign={Gtk.Align.END}>
          <SysTray />
          <Audio />
          <Battery />
          <Clock />
        </box>
      </centerbox>
    </window>
  )
}

// Entry point
export default function Bar(monitor: Gdk.Monitor) {
  return BarLayout(monitor)
}
