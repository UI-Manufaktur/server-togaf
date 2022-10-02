module servers.togaf.views.gbbs.read;

@safe:
import servers.togaf;

class DTGFGbbReadView : DMVCView {
  mixin(MVCViewThis!("TGFGbbReadView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFGbbReadView~":TGFGbbReadView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("GBBs -> Read")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFGbbReadView", "DTGFGbbReadView"));
