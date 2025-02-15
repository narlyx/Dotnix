import { Astal, Gdk } from 'astal/gtk3';
import RoundedCorner from './screen-corners';

const TopLeftBar = (monitor: Gdk.Monitor) => (
  <window
    name="cornertl"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.TOP}
    anchor={Astal.WindowAnchor.TOP|Astal.WindowAnchor.LEFT}
    clickThrough={true}>
    {RoundedCorner('topleftbar')}
  </window>
);

const TopRightBar = (monitor: Gdk.Monitor) => (
  <window
    name="cornertr"
    gdkmonitor={monitor}
    exclusivity={Astal.Exclusivity.TOP}
    anchor={Astal.WindowAnchor.TOP|Astal.WindowAnchor.RIGHT}
    clickThrough={true}>
    {RoundedCorner('toprightbar')}
  </window>
);

const TopLeft = (monitor: Gdk.Monitor) => (
  <window
    name="cornertl"
    gdkmonitor={monitor}
    layer={Astal.Layer.OVERLAY}
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.TOP|Astal.WindowAnchor.LEFT}
    clickThrough={true}>
    {RoundedCorner('topleft')}
  </window>
);

const TopRight = (monitor: Gdk.Monitor) => (
  <window
    name="cornertr"
    gdkmonitor={monitor}
    layer={Astal.Layer.OVERLAY}
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.TOP|Astal.WindowAnchor.RIGHT}
    clickThrough={true}>
    {RoundedCorner('topright')}
  </window>
);

const BottomLeft = (monitor: Gdk.Monitor) => (
  <window
    name="cornerbl"
    gdkmonitor={monitor}
    layer={Astal.Layer.OVERLAY}
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.BOTTOM|Astal.WindowAnchor.LEFT}
    clickThrough={true}>
    {RoundedCorner('bottomleft')}
  </window>
);

const BottomRight = (monitor: Gdk.Monitor) => (
  <window
    name="cornerbr"
    gdkmonitor={monitor}
    layer={Astal.Layer.OVERLAY}
    exclusivity={Astal.Exclusivity.IGNORE}
    anchor={Astal.WindowAnchor.BOTTOM|Astal.WindowAnchor.RIGHT}
    clickThrough={true}>
    {RoundedCorner('bottomright')}
  </window>
);

export default (monitor: Gdk.Monitor) => [
  TopLeft(monitor),
  TopRight(monitor),
  BottomLeft(monitor),
  BottomRight(monitor)
];
