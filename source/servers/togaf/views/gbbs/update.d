module servers.togaf.views.gbbs.update;

@safe:
import servers.togaf;

class DTGFGbbUpdateView : DMVCView {
  mixin(MVCViewThis!("TGFGbbUpdateView"));

  override void initialize() {
    super.initialize;
  }
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFGbbUpdateView~":TGFGbbUpdateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("GBBs -> Update")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFGbbUpdateView", "DTGFGbbUpdateView"));
