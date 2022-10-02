module servers.togaf.views.abbs.index;

@safe:
import servers.togaf;

class DTGFAbbIndexView : DMVCView {
  mixin(MVCViewThis!("TGFAbbIndexView"));

  override void initialize() {
    super.initialize;
  }
  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!TGFAbbIndexView~":TGFAbbIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("ABBs -> Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFAbbIndexView", "DTGFAbbIndexView"));
