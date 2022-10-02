module servers.togaf.controllers.actions.lbbs.delete_;

@safe:
import servers.togaf;

class DTGFLbbDeleteActionController : DMVCActionController {
  mixin(MVCControllerThis!("TGFLbbDeleteActionController"));

  override void initialize() {
    super.initialize;
  }
}
mixin(MVCControllerCalls!("TGFLbbDeleteActionController", "DTGFLbbDeleteActionController"));
