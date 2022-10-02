module servers.togaf.views.abbs.update;

@safe:
import servers.togaf;

class DTGFAbbUpdateView : DMVCView {
  mixin(MVCViewThis!("TGFAbbUpdateView"));

  override void initialize() {
    super.initialize;
  }
  
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFAbbUpdateView~":TGFAbbUpdateView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("ABBs -> Update")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFAbbUpdateView", "DTGFAbbUpdateView"));
