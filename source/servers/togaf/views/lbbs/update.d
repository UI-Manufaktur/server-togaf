module servers.togaf.views.lbbs.update;

@safe:
import servers.togaf;

class DTGFLbbUpdateView : DMVCView {
  mixin(MVCViewThis!("TGFLbbUpdateView"));

  override void initialize() {
    super.initialize;
  }
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFLbbUpdateView~":TGFLbbUpdateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("LBBs -> Update")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFLbbUpdateView", "DTGFLbbUpdateView"));
