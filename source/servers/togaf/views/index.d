module servers.togaf.views.index;

@safe:
import servers.togaf;

class DTGFIndexView : DMVCView {
  mixin(MVCViewThis!("TGFIndexView"));

  override DH5Obj[] toH5(STRINGAA options = null) {
    debugMethodCall(moduleName!DTGFIndexView~":DTGFIndexView("~this.name~")::toH5");
    super.toH5(options);

    return [
      H5Div("Index")
    ].toH5;
  }
}
mixin(MVCViewCalls!("TGFIndexView", "DTGFIndexView"));
