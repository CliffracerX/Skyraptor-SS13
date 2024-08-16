import { FeatureColorInput, Feature, FeatureChoiced, FeatureValueProps, FeatureChoicedServerData } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const feature_akula_tail: FeatureChoiced = {
  name: 'Tail',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};