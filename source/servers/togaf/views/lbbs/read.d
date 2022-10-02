module servers.togaf.views.lbbs.read;

@safe:
import servers.togaf;

class DTGFLbbReadView : DMVCView {
  mixin(MVCViewThis!("TGFLbbReadView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFLbbReadView~":TGFLbbReadView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("LBBs -> Read")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFLbbReadView", "DTGFLbbReadView"));
