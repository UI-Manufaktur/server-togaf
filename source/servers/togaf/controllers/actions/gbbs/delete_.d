module servers.togaf.controllers.actions.gbbs.delete_;

@safe:
import servers.togaf;

class DTGFGbbDeleteActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFGbbDeleteActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFGbbDeleteActionController", "DTGFGbbDeleteActionController"));
