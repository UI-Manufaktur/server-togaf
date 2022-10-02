module servers.togaf.views.gbbs.create;

@safe:
import servers.togaf;

class DTGFGbbCreateView : DMVCView {
  mixin(MVCViewThis!("TGFGbbCreateView"));

  override void initialize() {
    super.initialize;
  }

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFGbbCreateView~":TGFGbbCreateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("GBBs -> Create")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFGbbCreateView", "DTGFGbbCreateView"));
